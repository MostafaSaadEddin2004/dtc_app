import 'package:flutter/material.dart';

import '../Components/Posts.dart';

class StudentSavedPage extends StatefulWidget {
  const StudentSavedPage({super.key});
  static String id = 'StudentSavedPage';

  @override
  State<StudentSavedPage> createState() => _StudentSavedPageState();
}

class _StudentSavedPageState extends State<StudentSavedPage> {
  List<Map> posts = const [
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '2:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'PostText':
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
          itemBuilder: (context, index) => Posts(
              time: posts[index]["Time"].toString(),
              Poster: posts[index]["Poster"].toString(),
              PostImage: posts[index]['Images'].toString(),
              postText: posts[index]['PostText'].toString()),
        ),
      ),
    );
  }
}
