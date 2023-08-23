class ComparisonModel {
  final int id;
  final String name;
  final int mark;

  ComparisonModel({
    required this.id,
    required this.name,
    required this.mark,
  });

  factory ComparisonModel.fromJson(Map<String, dynamic> jsonData) {
    return ComparisonModel(
      id: jsonData['id'],
      name: jsonData['name'],
      mark: jsonData['mark'],
    );
  }
}
