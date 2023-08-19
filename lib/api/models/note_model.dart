class NoteModel {
  int id;
  String title;
  String description;
  String category;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  factory NoteModel.fromJson(Map<String, dynamic> jsonData) {
    return NoteModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
    );
  }
}
