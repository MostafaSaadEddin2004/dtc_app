import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loading.dart';
import '../../api/models/post_model.dart';
import '../../api/services/depatrment_post_services.dart';

class TeacherDepartmentPostsPage extends StatefulWidget {
  const TeacherDepartmentPostsPage({super.key});
  static String id = '/TeacherDepartmentPostsPage';

  @override
  State<TeacherDepartmentPostsPage> createState() =>
      _TeacherDepartmentPostsPageState();
}

List<Map> posts = [];

class _TeacherDepartmentPostsPageState
    extends State<TeacherDepartmentPostsPage> {
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
                    postId: posts[index].id,
                    isFavorite: posts[index].likedByMe,
                    isSaved: posts[index].savedByMe,
                    count: posts[index].likes,
                    time: posts[index].createdAt.toString(),
                    depName: posts[index].department_name!,
                    postImage: posts[index].attachment.toString(),
                    postText: posts[index].content),
              );
            }),
      ),
    );
  }
}
