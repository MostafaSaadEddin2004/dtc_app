import 'package:flutter/material.dart';

import '../Components/Posts.dart';

class TeacherAuthSavedPage extends StatefulWidget {
  const TeacherAuthSavedPage({super.key});
  static String id = 'TeacherAuthSavedPage';

  @override
  State<TeacherAuthSavedPage> createState() => _TeacherAuthSavedPageState();
}

class _TeacherAuthSavedPageState extends State<TeacherAuthSavedPage> {
  List<Map> posts = const [
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'Posttext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '2:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'Posttext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => DTCPosts(
              time: posts[index]["Time"].toString(),
              postImage: posts[index]['Images'].toString(),
              posttext: posts[index]['Posttext'].toString()),
        ),
      ),
    );
  }
}
