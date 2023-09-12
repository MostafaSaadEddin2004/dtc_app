class EditMarkRequestModel {
  final String subject;
  final int mark;
  final String reason;
  final String teacher;
  final int user_id;

  EditMarkRequestModel({
    required this.subject,
    required this.mark,
    required this.reason,
    required this.teacher,
    required this.user_id,
  });

  factory EditMarkRequestModel.fromJson(Map<String, dynamic> jsonData) {
    return EditMarkRequestModel(
      subject: jsonData['subject'],
      mark: jsonData['mark'],
      reason: jsonData['reason'],
      teacher: jsonData['teacher'],
      user_id: jsonData['user_id'],
    );
  }
}
