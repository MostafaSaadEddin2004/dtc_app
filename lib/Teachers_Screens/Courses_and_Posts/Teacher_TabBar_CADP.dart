import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';
import '../../Start_App_Screens/SignUp_Type.dart';
import '../Teacher_Profile_Page.dart';
import 'Teacher_Course_Page.dart';
import 'Teacher_Department_Posts_Page.dart';

class TeacherTabBar extends StatefulWidget {
  const TeacherTabBar({super.key});
  static String id = 'TeacherTabBar';

  @override
  State<TeacherTabBar> createState() => _TeacherTabBarState();
}

class _TeacherTabBarState extends State<TeacherTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            bottom: const TabBar(
              indicatorColor: WhiteColor,
              unselectedLabelStyle: TextStyle(fontSize: 16),
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  child: Text('الدورات'),
                ),
                Tab(
                  child: Text('منشورات القسم'),
                ),
              ],
            ),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'IT',
                  style: TextStyle(
                      color: WhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
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
                            .push(MaterialPageRoute(builder: (contex) {
                          return TeacherProfilePage();
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      SignUpType.id,
                      (Route<dynamic> route) => false,
                    );
                    Navigator.of(context).pushReplacementNamed(SignUpType.id);
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
            ),
          ),
          body: const TabBarView(
            children: [TeacherCoursePage(), TeacherDepartmentPostsPage()],
          )),
    );
  }
}
