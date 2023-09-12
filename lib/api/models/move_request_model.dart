class MoveRequestModel {
  final String text;
  final int mark;
  final int department_id;
  final int specialty_id;
  double user_id;

  MoveRequestModel({
    required this.text,
    required this.mark,
    required this.department_id,
    required this.specialty_id,
    required this.user_id,
  });

  factory MoveRequestModel.fromJson(Map<String, dynamic> jsonData) {
    return MoveRequestModel(
      text: jsonData['text'],
      mark: jsonData['mark'],
      department_id: jsonData['department_id'],
      specialty_id: jsonData['specialty_id'],
      user_id: jsonData['user_id'],
    );
  }
}
