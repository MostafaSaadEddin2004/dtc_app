import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/blocs/get_user_information/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/Posts.dart';
import '../Components/loading.dart';
import '../Constants/Colors.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/models/post_model.dart';
import '../api/services/public_post_services.dart';
import 'Teacher_Auth_Profile_Page.dart';

class TeacherAuthHomePage extends StatefulWidget {
  const TeacherAuthHomePage({super.key});

  static String id = '/TeacherAuthHomePage';

  @override
  State<TeacherAuthHomePage> createState() => _TeacherAuthHomePageState();
}

List<Map> posts = [];

class _TeacherAuthHomePageState extends State<TeacherAuthHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserInformationCubit()..fetchData(),
      child: Builder(builder: (context) {
        final state =
            BlocProvider.of<GetUserInformationCubit>(context, listen: true)
                .state;
        if (state is! GetUserInformationFetched) return Loading();
        final userData = state.userData;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${userData.section}',
                  style: TextStyle(
                      color: WhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            ],
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
                              .popAndPushNamed(TeacherAuthProfilePage.id);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: WhiteColor,
                          backgroundImage: NetworkImage(userData.image != null
                              ? userData.image!
                              : 'assets/images/person.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            userData.first_name_en.toString() +
                                ' ' +
                                userData.last_name_en.toString(),
                            style: TextStyle(
                                color: WhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            userData.email.toString(),
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
              )),
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
      }),
    );
  }
}
