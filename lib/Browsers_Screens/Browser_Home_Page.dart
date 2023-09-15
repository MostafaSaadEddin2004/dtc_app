import 'package:dtc_app/api/models/post_model.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../Components/Posts.dart';
import '../Components/loading.dart';
import '../Constants/Colors.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/services/public_post_services.dart';
import 'Browser_Profile_Page.dart';

class BrowserHomePage extends StatefulWidget {
  const BrowserHomePage({super.key});
  static String id = 'BrowserHomePage';

  @override
  State<BrowserHomePage> createState() => _BrowserHomePageState();
}

List<Map> posts = [];

class _BrowserHomePageState extends State<BrowserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
      ),
      drawer: Drawer(
        backgroundColor: PrimaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BrowserProfilePage();
                    }));
                  },
                  child: const CircleAvatar(
                    minRadius: 30,
                    maxRadius: 30,
                    backgroundColor: WhiteColor,
                    child: Icon(
                      Icons.person,
                      color: PrimaryColor,
                      size: 45,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: const [
                    Text(
                      'إسم المستخدم',
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '1A2B3C',
                      style: TextStyle(
                        color: WhiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: WhiteColor, thickness: 2),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.people,
                    color: WhiteColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'دعوة صديق',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                 AuthServices.postLogout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(SignUpType.id, (route) => false);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.exit_to_app_rounded,
                    color: RedColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                        color: RedColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
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
