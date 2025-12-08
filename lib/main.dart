import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/biometric_test_view.dart';

/// ---------------------------------------------------------------------------
/// Empreinte Verif — main.dart PRO
/// ---------------------------------------------------------------------------
/// - Point d’entrée unique de l’application
/// - Utilise le système PRO de vues : LoginView / HomeView / BiometricTestView
/// - Aucune logique biométrique directement ici : tout passe par les services
/// - Prêt pour l’intégration API + SecureStorage dans les vues
/// ---------------------------------------------------------------------------

void main() {
  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatelessWidget {
  const EmpreinteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nom officiel de l’application (centralisé dans AppConfig)
      title: AppConfig.appName,

      // On garde une UI propre sans bandeau "debug" en haut à droite.
      debugShowCheckedModeBanner: false,

      // Thème simple et propre, pourra être relié plus tard à un Theme PRO.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff2f2f2),
        useMaterial3: false,
      ),

      // Écran de démarrage officiel : LoginView (système PRO)
      home: const LoginView(),

      // Routes nommées principales, utilisables partout dans l’app
      routes: {
        '/login': (context) => const LoginView(),
        '/home': (context) => const HomeView(),
        '/biometric-test': (context) => const BiometricTestView(),
      },
    );
  }
}
