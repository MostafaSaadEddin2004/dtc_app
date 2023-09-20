class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String created_at;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.body,
      required this.created_at});

  factory NotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationModel(
        id: jsonData['id'],
        title: jsonData['title'],
        body: jsonData['body'],
        created_at: jsonData['created_at']);
  }
}
