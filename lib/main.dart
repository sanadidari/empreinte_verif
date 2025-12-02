import 'dart:io' show Platform;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatelessWidget {
  const EmpreinteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empreinte Vérif",
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isChecking = false;

  /// Détecte si on est sur Flutter Web
  bool _isWeb() {
    try {
      return identical(0, 0.0); 
    } catch (_) {
      return false;
    }
  }

  /// Ouvre un lien externe
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Lien vers ta page d'installation complète
  final String installUrl =
      "https://sanadidari.com/testftp/setup/setup.html";

  /// Tentative d'ouverture de l'app Android (si installée)
  Future<bool> tryOpenAndroidApp() async {
    final Uri uri = Uri.parse(
        "intent://empreinte#Intent;scheme=empreinteverif;package=com.example.empreinte_verif;end");

    try {
      bool ok = await launchUrl(uri,
          mode: LaunchMode.externalApplication, webOnlyWindowName: "_self");

      return ok;
    } catch (_) {
      return false;
    }
  }

  /// Fonction principale biométrie / redirection
  Future<void> _startBiometric() async {
    setState(() => _isChecking = true);

    try {
      // 🔹 1 — CAS WEB → on ouvre install.html
      if (_isWeb()) {
        await openLink(installUrl);
        return;
      }

      // 🔹 2 — CAS ANDROID : vérifier si l'app Android est déjà installée
      bool appInstalled = await tryOpenAndroidApp();
      if (appInstalled) {
        // L'app Android existe → pas besoin de télécharger
        return;
      }

      // 🔹 3 — Vérifier si biométrie supportée
      bool canCheck = await auth.canCheckBiometrics;
      bool supported = await auth.isDeviceSupported();

      if (!canCheck || !supported) {
        // Pas de biométrie → redirection installation APK
        await openLink(installUrl);
        return;
      }

      // 🔹 4 — Tentative d'auth biométrique
      bool didAuth = await auth.authenticate(
        localizedReason: "Veuillez scanner votre empreinte",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (didAuth) {
        if (!mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PageProjets()),
        );
      } else {
        await openLink(installUrl);
      }
    } catch (e) {
      // Toute erreur → installation
      await openLink(installUrl);
    }

    setState(() => _isChecking = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fingerprint, size: 120, color: Colors.blue),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isChecking ? null : _startBiometric,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isChecking
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Scanner l'empreinte",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageProjets extends StatelessWidget {
  const PageProjets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Projets de l'employé")),
      body: const Center(
        child: Text("Liste des projets (à venir)",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
