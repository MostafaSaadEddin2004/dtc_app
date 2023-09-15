class DepartmentModel {
  final int id;
  final String name;

  DepartmentModel({
    required this.id,
    required this.name,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> jsonData) {
    return DepartmentModel(id: jsonData['id'], name: jsonData['name']);
  }
}
