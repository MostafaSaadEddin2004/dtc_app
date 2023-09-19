import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loading.dart';
import '../../api/models/post_model.dart';
import '../../api/services/course_post_services.dart';
import '../Registering_Screens/Short_Courses/Student_Personal_Information.dart';

class StudentCoursePage extends StatefulWidget {
  const StudentCoursePage({super.key});

  static String id = 'StudentCoursePage';

  @override
  State<StudentCoursePage> createState() => _StudentCoursePageState();
}

List<Map> posts = [];

class _StudentCoursePageState extends State<StudentCoursePage> {
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
                itemBuilder: (context, index) => RegisterCoursesPost(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        StudentPersonalInformation.id,
                        arguments: posts[index].id);
                  },
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
                  postText: posts[index].content,
                  courseName: posts[index].course_name ?? '',
                ),
              );
            }),
      ),
    );
  }
}
