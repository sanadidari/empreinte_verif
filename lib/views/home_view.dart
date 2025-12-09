// ===========================================================
// home_view.dart — Écran principal PRO
// ===========================================================

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../projets.dart'; // ✅ Ajout pour navigation vers ProjetsPage

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue dans ${AppConfig.appName}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              child: const Text("Voir les projets"),
              onPressed: () {
                // Pour l’instant, on affiche des données fictives PROPREMENT
                final projetsDemo = [
                  {
                    "titre": "Projet Alpha",
                    "description": "Développement biométrique",
                    "semaine_debut": "Semaine 12"
                  },
                  {
                    "titre": "Projet Bravo",
                    "description": "Intégration API",
                    "semaine_debut": "Semaine 14"
                  },
                ];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProjetsPage(
                      projets: projetsDemo,
                      employeeName: "Employé Démo",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Tester la biométrie"),
              onPressed: () {
                // Page de test biométrique déjà existante
                Navigator.pushNamed(context, '/biometric-test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
