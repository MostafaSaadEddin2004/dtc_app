import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loading.dart';
import '../../api/models/post_model.dart';
import '../../api/services/depatrment_post_services.dart';

class StudentsDepartmentPostsPage extends StatefulWidget {
  const StudentsDepartmentPostsPage({super.key});
  static String id = 'StudentsDepartmentPostsPage';

  @override
  State<StudentsDepartmentPostsPage> createState() =>
      _StudentsDepartmentPostsPageState();
}

List<Map> posts = [];

class _StudentsDepartmentPostsPageState
    extends State<StudentsDepartmentPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: DepartmentPostServices.getDepartmentPost(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => DepartmentPosts(
                    onChange: (isFavorite, isSaved, count) {
                      posts[index].likedByMe = isFavorite;
                      posts[index].savedByMe = isSaved;
                      posts[index].likes = count;
                    },
                    isFavorite: posts[index].likedByMe,
                    isSaved: posts[index].savedByMe,
                    count: posts[index].likes,
                    time: posts[index].createdAt.toString(),
                    postImage: posts[index].attachment.toString(),
                    postText: posts[index].content),
              );
            }),
      ),
    );
  }
}
