import 'package:dtc_app/Components/Posts.dart';
import 'package:dtc_app/Constents/TextStyle.dart';
import 'package:flutter/material.dart';

import '../Components/BottomNavBar.dart';
import '../Constents/Colors.dart';
import 'Courses_and_Posts/Student_Course_Page.dart';
import 'Courses_and_Posts/Student_TabBar_CADP.dart';
import 'Student_Home_Page.dart';
import 'Student_Notes_Page.dart';
import 'Student_Profile_Page.dart';
import 'Student_Notifications_Page.dart';

class StudentStartPage extends StatefulWidget {
  const StudentStartPage({super.key});

  static String id = 'StudentStartPage';

  @override
  State<StudentStartPage> createState() => _StudentStartPageState();
}

class _StudentStartPageState extends State<StudentStartPage> {
  @override
  TextEditingController searchController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> pages = const [
    StudentHomePage(),
    StudentNotificationsPage(),
    StudentNotesPage(),
    StudentTabBar()
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
