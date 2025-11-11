class Attraction {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  bool isVisited;

  Attraction({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    this.isVisited = false,
  });
}