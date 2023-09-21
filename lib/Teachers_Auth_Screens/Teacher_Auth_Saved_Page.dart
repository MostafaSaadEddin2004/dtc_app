import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/api/services/saved_post_service.dart';
import 'package:flutter/material.dart';
import '../Components/Posts.dart';

class TeacherAuthSavedPage extends StatefulWidget {
  const TeacherAuthSavedPage({super.key});
  static String id = '/TeacherAuthSavedPage';

  @override
  State<TeacherAuthSavedPage> createState() => _TeacherAuthSavedPageState();
}

class _TeacherAuthSavedPageState extends State<TeacherAuthSavedPage> {
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
        child: FutureBuilder(
            future: SavedPostService.getSavedPost(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) =>
                      posts[index].savedByMe == true
                          ? DTCPosts(
                              onChange: (isFavorite, isSaved, count) {
                                posts[index].likedByMe = isFavorite;
                                posts[index].savedByMe = isSaved;
                                posts[index].likes = count;
                              },
                              postId: posts[index].id,
                              isFavorite: posts[index].likedByMe,
                              isSaved: posts[index].savedByMe,
                              count: posts[index].likes,
                              time: posts[index].createdAt,
                              postImage: posts[index].attachment,
                              postText: posts[index].content)
                          : const SizedBox());
            }),
      ),
    );
  }
}
