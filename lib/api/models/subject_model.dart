class SubjectModel {
  final int id;
  final String name;

  SubjectModel({required this.id, required this.name});

  factory SubjectModel.fromJson(Map<String, dynamic> jsonData) {
    return SubjectModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
