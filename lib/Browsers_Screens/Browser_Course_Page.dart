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

  static String id = 'BrowserCoursePage';

  @override
  State<BrowserCoursePage> createState() => _BrowserCoursePageState();
}

List<Map> posts = [];

class _BrowserCoursePageState extends State<BrowserCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
      ),
      drawer: Drawer(
        backgroundColor: PrimaryColor,
        child: FutureBuilder(
            future: AuthServices.getUserInformation(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final users = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
                child: Column(children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (contex) => const BrowserProfilePage()));
                        },
                        child: CircleAvatar(
                            minRadius: 30,
                            maxRadius: 30,
                            backgroundColor: WhiteColor,
                            // ignore: unnecessary_null_comparison
                            child: users.image.toString() == null
                                ? Icon(
                                    Icons.person,
                                    color: PrimaryColor,
                                    size: 45,
                                  )
                                : Image.network(
                                    users.image.toString(),
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30,
                                  )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            users.first_name_en.toString() +
                                ' ' +
                                users.last_name_en.toString(),
                            style: TextStyle(
                                color: WhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            users.email.toString(),
                            style: TextStyle(
                              color: WhiteColor,
                              fontSize: 10,
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
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.assignment_ind,
                          color: WhiteColor,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'التسجيل كطالب',
                          style: TextStyle(
                              color: WhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthServices.postLogout();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        SignUpType.id,
                        (Route<dynamic> route) => false,
                      );
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
                  )
                ]),
              );
            }),
      ),
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
                  courseName: posts[index].course_name ?? '',
                ),
              );
            }),
      ),
    );
  }
}
