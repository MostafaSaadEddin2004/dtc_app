import 'package:flutter/material.dart';
import '../../Constents/Colors.dart';
import '../../SignUp_Type.dart';
import '../Student_Profile_Page.dart';
import 'Student_Course_Page.dart';
import 'Students_Department_Posts_Page.dart';

class StudentTabBar extends StatefulWidget {
  const StudentTabBar({super.key});
  static String id = 'StudentTabBar';

  @override
  State<StudentTabBar> createState() => _StudentTabBarState();
}

class _StudentTabBarState extends State<StudentTabBar> {
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'IT / IT',
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
                          return StudentProfilePage();
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
            children: [StudentCoursePage(), StudentsDepartmentPostsPage()],
          )),
    );
    ;
  }
}
