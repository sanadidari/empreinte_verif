import 'package:flutter/material.dart';
import '../services/biometric_service.dart';
import '../services/secure_storage.dart';
import '../services/api_service.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bio = BiometricService();
  String status = "";

  Future<void> authenticate() async {
    setState(() => status = "Vérification biométrique…");

    final available = await bio.isBiometricAvailable();
    if (!available) {
      setState(() => status = "❌ Biométrie non disponible.");
      return;
    }

    final ok = await bio.authenticate();
    if (!ok) {
      setState(() => status = "❌ Échec biométrique.");
      return;
    }

    // 🔥 NOUVEAU : on récupère le token réel stocké dans l'appareil
    final token = await SecureStorage.getToken();

    if (token == null || token.isEmpty) {
      setState(() => status = "❌ Aucun token trouvé.\nVeuillez contacter l’administrateur.");
      return;
    }

    final api = await ApiService.authEmployee(token);

    if (api["success"] == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(
            employeeName: api["employee"]["name"],
            employeeId: api["employee"]["id"],
          ),
        ),
      );
    } else {
      setState(() => status = "❌ API: ${api["message"]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion employé")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: authenticate,
              child: const Text("Se connecter avec empreinte"),
            ),
            const SizedBox(height: 20),
            Text(status),
          ],
        ),
      ),
    );
  }
}
