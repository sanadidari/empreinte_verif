class Projet {
  final int id;
  final String titre;
  final String? description;

  Projet({
    required this.id,
    required this.titre,
    this.description,
  });
}
