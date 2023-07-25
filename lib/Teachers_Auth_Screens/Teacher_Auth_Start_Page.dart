import 'package:dtc_app/Components/Posts.dart';
import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:flutter/material.dart';

import '../Components/BottomNavBar.dart';
import '../Constants/Colors.dart';
import 'Courses_and_Posts/Teacher_Auth_Course_Page.dart';
import 'Courses_and_Posts/Teacher_Auth_TabBar_CADP.dart';
import 'Teacher_Auth_Home_Page.dart';
import 'Teacher_Auth_Notes_Page.dart';
import 'Teacher_Auth_Profile_Page.dart';
import 'Teacher_Auth_Notifications_Page.dart';

class TeacherAuthStartPage extends StatefulWidget {
  const TeacherAuthStartPage({super.key});

  static String id = 'TeacherAuthStartPage';

  @override
  State<TeacherAuthStartPage> createState() => _TeacherAuthStartPageState();
}

class _TeacherAuthStartPageState extends State<TeacherAuthStartPage> {
  @override
  TextEditingController searchController = TextEditingController();
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

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
