// ===============================================================
// main.dart — Architecture PRO avec système de routes centralisé
// Projet : empreinte_verif
// Auteur : Agent PRO v3.0
// ===============================================================

import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/biometric_test_view.dart';
import 'projets.dart'; // Écran projets officiel

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

      // =============================================================
      // ROUTES CENTRALISÉES (VERSION PRO)
      // =============================================================
      initialRoute: '/login',

      routes: {
        '/login': (_) => const LoginView(),
        '/home': (_) => const HomeView(),
        '/biometric-test': (_) => const BiometricTestView(),

        // Écran projets (appelé depuis HomeView)
        '/projets': (_) => const ProjetsPage(
              projets: [],
              employeeName: "Employé",
            ),
      },

      // =============================================================
      // THEME PRO — Material 3 Clean
      // =============================================================
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff6f6f6),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          centerTitle: true,
        ),
      ),
    );
  }
}
