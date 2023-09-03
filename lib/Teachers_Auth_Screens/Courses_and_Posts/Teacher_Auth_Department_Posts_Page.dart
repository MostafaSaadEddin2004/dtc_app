import 'package:dtc_app/api/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../Components/Posts.dart';
import '../../Components/loaing.dart';
import '../../Constants/Colors.dart';
import '../../api/services/depatrment_post_services.dart';
import '../Adding_Posts.dart';
import '../Editing_Posts.dart';

class TeacherAuthDepartmentPostsPage extends StatefulWidget {
  const TeacherAuthDepartmentPostsPage({super.key});
  static String id = 'TeacherAuthDepartmentPostsPage';

  @override
  State<TeacherAuthDepartmentPostsPage> createState() =>
      _TeacherAuthDepartmentPostsPageState();
}

List posts = [];

class _TeacherAuthDepartmentPostsPageState
    extends State<TeacherAuthDepartmentPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: PrimaryColor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddingPostPage(),
            ));
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: WhiteColor,
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: FutureBuilder<List<PostModel>>(
            future: DepartmentPostServices.getDepartmentPost(
                'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt'),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => PostDepartmentPosts(
                    onChange: (isFavorite, isSaved, count) {
                      posts[index].likedByMe = isFavorite;
                      posts[index].savedByMe = isSaved;
                      posts[index].likes = count;
                    },
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          margin: const EdgeInsets.all(15),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  minRadius: 25,
                                  maxRadius: 25,
                                  child: Icon(
                                    Icons.person,
                                    color: WhiteColor,
                                    size: 35,
                                  ),
                                  backgroundColor: PrimaryColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'اسم القسم',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      posts[index].createdAt,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: BlackColor,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      EditingPostPage.id,
                                      arguments: posts[index]);
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.edit),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'تعديل المنشور',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.delete),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('حذف المنشور',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                    isFavorite: posts[index].likedByMe,
                    isSaved: posts[index].savedByMe,
                    count: posts[index].likes,
                    time: posts[index].createdAt.toString(),
                    depName: 'إسم القسم',
                    postImage: posts[index].attachment.toString(),
                    postText: posts[index].content),
              );
            }),
      ),
    );
  }
}
