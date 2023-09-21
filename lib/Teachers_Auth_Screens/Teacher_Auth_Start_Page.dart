import 'package:flutter/material.dart';
import '../Components/BottomNavBar.dart';
import 'Courses_and_Posts/Teacher_Auth_TabBar_CADP.dart';
import 'Teacher_Auth_Home_Page.dart';
import 'Teacher_Auth_Notes_Page.dart';
import 'Teacher_Auth_Notifications_Page.dart';

class TeacherAuthStartPage extends StatefulWidget {
  const TeacherAuthStartPage({super.key});

  static String id = '/TeacherAuthStartPage';

  @override
  State<TeacherAuthStartPage> createState() => _TeacherAuthStartPageState();
}

class _TeacherAuthStartPageState extends State<TeacherAuthStartPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> pages = const [
    TeacherAuthHomePage(),
    TeacherAuthNotificationsPage(),
    TeacherAuthNotesPage(),
    TeacherAuthTabBar()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: studentBottomNavBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
        body: pages.elementAt(selectedIndex));
  }
}
