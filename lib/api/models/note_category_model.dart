class NoteCategoryModel {
  final int id;
  final String name;

  NoteCategoryModel({
    required this.id,
    required this.name,
  });

  factory NoteCategoryModel.formJson(Map<String, dynamic> jsonData) {
    return NoteCategoryModel(id: jsonData['id'], name: jsonData['name']);
  }
}
