class PostModel {
  final int id;
  final String content;
  final String attachment;
  final String? department_name;
  final String? course_name;
  final String attachmentType;
  final String createdAt;
  int likes;
  bool likedByMe;
  int saves;
  bool savedByMe;
  bool is_open;

  PostModel({
    required this.id,
    required this.content,
    required this.attachment,
    required this.department_name,
    required this.course_name,
    required this.attachmentType,
    required this.createdAt,
    required this.likes,
    required this.likedByMe,
    required this.saves,
    required this.savedByMe,
    required this.is_open,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      id: jsonData['id'],
      createdAt: jsonData['created_at'],
      content: jsonData['content'],
      attachment: jsonData['attachment'],
      department_name: jsonData['department_name'],
      course_name: jsonData['course_name'],
      attachmentType: jsonData['attachment_type'],
      likes: jsonData['likes'],
      likedByMe: jsonData['liked_by_me'],
      saves: jsonData['saves'],
      savedByMe: jsonData['saved_by_me'],
      is_open: jsonData['is_open'],
    );
  }
}
