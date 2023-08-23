import 'package:dtc_app/api/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loaing.dart';
import '../../Constants/Colors.dart';
import '../../api/services/depatrment_post_services.dart';
import '../Adding_Posts.dart';

class TeacherAuthDepartmentPostsPage extends StatefulWidget {
  const TeacherAuthDepartmentPostsPage({super.key});
  static String id = 'TeacherAuthDepartmentPostsPage';

  @override
  State<TeacherAuthDepartmentPostsPage> createState() =>
      _TeacherAuthDepartmentPostsPageState();
}

List posts = [];

class _TeacherAuthDepartmentPostsPageState
    extends State<TeacherAuthDepartmentPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: PrimaryColor,
          onPressed: ()  {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddingPostPage(),
            ));
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: WhiteColor,
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: DepartmentPostServices.getDepartmentPost(
                'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt'),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => PostDepartmentPosts(
                    onChange: (isFavorite, isSaved, count) {
                      posts[index].likedByMe = isFavorite;
                      posts[index].savedByMe = isSaved;
                      posts[index].likes = count;
                    },
                    isFavorite: posts[index].likedByMe,
                    isSaved: posts[index].savedByMe,
                    count: posts[index].likes,
                    time: posts[index].createdAt.toString(),
                    depName: 'إسم القسم',
                    postImage: posts[index].attachment.toString(),
                    postText: posts[index].content),
              );
            }),
      ),
    );
  }
}
