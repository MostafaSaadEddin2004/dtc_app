import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../Components/Posts.dart';
import '../Components/loading.dart';
import '../Constants/Colors.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/models/post_model.dart';
import '../api/services/course_post_services.dart';
import 'Browser_Profile_Page.dart';
import 'Registration_Screens/Short_Course/Browser_Personal_Information.dart';

class BrowserCoursePage extends StatefulWidget {
  const BrowserCoursePage({super.key});

  static String id = '/BrowserCoursePage';

  @override
  State<BrowserCoursePage> createState() => _BrowserCoursePageState();
}

List<Map> posts = [];

class _BrowserCoursePageState extends State<BrowserCoursePage> {
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
                        BrowserPersonalInformation.id,
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
                  courseName: posts[index].course_name!,
                ),
              );
            }),
      ),
    );
  }
}
