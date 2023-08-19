class PostModel {
  int id;
  String content;
  String attachment;
  String attachmentType;
  String createdAt;
  int likes;
  bool likedByMe;
  int saves;
  bool savedByMe;

  PostModel({
    required this.id,
    required this.content,
    required this.attachment,
    required this.createdAt,
    required this.attachmentType,
    required this.likes,
    required this.likedByMe,
    required this.saves,
    required this.savedByMe,
  });

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      id: jsonData['id'],
      createdAt: jsonData['created_at'],
      content: jsonData['content'],
      attachment: jsonData['attachment'],
      attachmentType: jsonData['attachment_type'],
      likes: jsonData['likes'],
      likedByMe: jsonData['liked_by_me'],
      saves: jsonData['saves'],
      savedByMe: jsonData['saved_by_me'],
    );
  }
}
