class MoveRequestModel {
  final String text;
  final int department_id;

  MoveRequestModel({
    required this.text,
    required this.department_id,
  });

  factory MoveRequestModel.fromJson(Map<String, dynamic> jsonData) {
    return MoveRequestModel(
      text: jsonData['text'],
      department_id: jsonData['department_id'],
    );
  }
}
