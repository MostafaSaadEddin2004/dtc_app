import 'package:dtc_app/api/models/post_model.dart';
import 'package:flutter/material.dart';
import '../Components/Posts.dart';
import '../Components/loading.dart';
import '../api/services/public_post_services.dart';

class BrowserHomePage extends StatefulWidget {
  const BrowserHomePage({super.key});
  static String id = '/BrowserHomePage';

  @override
  State<BrowserHomePage> createState() => _BrowserHomePageState();
}

List<Map> posts = [];

class _BrowserHomePageState extends State<BrowserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: PublicPostServices.getPublicPost(),
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
                    postId: posts[index].id,
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
