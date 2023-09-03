import 'package:flutter/material.dart';

import '../Components/Posts.dart';
import '../api/services/public_post_services.dart';

class BrowserSavedPage extends StatefulWidget {
  const BrowserSavedPage({super.key});
  static String id = 'BrowserSavedPage';

  @override
  State<BrowserSavedPage> createState() => _BrowserSavedPageState();
}

class _BrowserSavedPageState extends State<BrowserSavedPage> {
  List<Map> posts = const [
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'posttext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '2:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'posttext':
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
              onChange: (isFavorite, isSaved, count) {
                dTCPostChange[index].isFavorite = isFavorite;
                dTCPostChange[index].isSaved = isSaved;
                dTCPostChange[index].count = count;
              },
              postId: 1,
              isFavorite: dTCPostChange[index].isFavorite,
              isSaved: dTCPostChange[index].isSaved,
              count: dTCPostChange[index].count,
              time: posts[index]["Time"].toString(),
              postImage: posts[index]['Images'].toString(),
              postText: posts[index]['posttext'].toString()),
        ),
      ),
    );
  }
}
