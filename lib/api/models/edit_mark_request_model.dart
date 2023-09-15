class EditMarkRequestModel {
  final String subject;
  final String mark;
  final String reason;
  final String teacher;

  EditMarkRequestModel({
    required this.subject,
    required this.mark,
    required this.reason,
    required this.teacher,
  });

  factory EditMarkRequestModel.fromJson(Map<String, dynamic> jsonData) {
    return EditMarkRequestModel(
      subject: jsonData['subject'],
      mark: jsonData['mark'],
      reason: jsonData['reason'],
      teacher: jsonData['teacher'],
    );
  }
}
