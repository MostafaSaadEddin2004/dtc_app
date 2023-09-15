class SpecialtyModel {
  final int id;
  final String name;
  final String mark;

  SpecialtyModel({
    required this.id,
    required this.name,
    required this.mark,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> jsonData) {
    return SpecialtyModel(
        id: jsonData['id'], name: jsonData['name'], mark: jsonData['mark']);
  }
}
