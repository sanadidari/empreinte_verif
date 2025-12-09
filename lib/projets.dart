// ===========================================================
// projets.dart — Version PRO (Appels API + Loader + Erreurs)
// ===========================================================

import 'package:flutter/material.dart';
import 'services/api_service.dart';

class ProjetsPage extends StatefulWidget {
  final int employeeId;
  final String employeeName;

  const ProjetsPage({
    super.key,
    required this.employeeId,
    required this.employeeName,
  });

  @override
  State<ProjetsPage> createState() => _ProjetsPageState();
}

class _ProjetsPageState extends State<ProjetsPage> {
  late Future<dynamic> _futureProjects;

  @override
  void initState() {
    super.initState();
    _futureProjects = ApiService.getProjects(widget.employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projets de ${widget.employeeName}"),
      ),
      body: FutureBuilder(
        future: _futureProjects,
        builder: (context, snapshot) {
          // -------------------------------
          // LOADER
          // -------------------------------
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // -------------------------------
          // ERREUR API
          // -------------------------------
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur : ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final data = snapshot.data;

          if (data == null || data["success"] == false) {
            return Center(
              child: Text(
                data?["message"] ?? "Aucun projet trouvé.",
                style: const TextStyle(fontSize: 16),
              ),
            );
          }

          final projets = data["projets"];

          // -------------------------------
          // AFFICHAGE DES PROJETS
          // -------------------------------
          return ListView.builder(
            itemCount: projets.length,
            itemBuilder: (context, index) {
              final p = projets[index];

              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    p["titre"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "${p["description"]}\nDébut : ${p["semaine_debut"]}",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
