import 'package:dtc_app/api/services/saved_post_service.dart';
import 'package:flutter/material.dart';
import '../Components/Posts.dart';
import '../Components/loading.dart';
import '../api/models/post_model.dart';

class StudentSavedPage extends StatefulWidget {
  const StudentSavedPage({super.key});
  static String id = '/StudentSavedPage';

  @override
  State<StudentSavedPage> createState() => _StudentSavedPageState();
}

class _StudentSavedPageState extends State<StudentSavedPage> {
  List<Map> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: SavedPostService.getSavedPost(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) =>
                      DTCPosts(
                              onChange: (isFavorite, isSaved, count) {
                                posts[index].likedByMe = isFavorite;
                                posts[index].savedByMe = isSaved;
                                posts[index].likes = count;
                              },
                              postId: posts[index].id,
                              isFavorite: posts[index].likedByMe,
                              isSaved: posts[index].savedByMe,
                              count: posts[index].likes,
                              time: posts[index].createdAt.toString(),
                              postImage: posts[index].attachment.toString(),
                              postText: posts[index].content)
                         );
            }),
      ),
    );
  }
}
