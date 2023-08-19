import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loaing.dart';
import '../../Students_Screens/Registering_Screens/Short_Courses/Student_Personal_Information.dart';
import '../../api/models/post_model.dart';
import '../../api/services/course_post_services.dart';

class TeacherAuthCoursePage extends StatefulWidget {
  const TeacherAuthCoursePage({super.key});

  static String id = 'TeacherAuthCoursePage';

  @override
  State<TeacherAuthCoursePage> createState() => _TeacherAuthCoursePageState();
}
  List<Map> posts = [];

class _TeacherAuthCoursePageState extends State<TeacherAuthCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: CoursePostServices.getCoursePost(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => DTCPosts(
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
