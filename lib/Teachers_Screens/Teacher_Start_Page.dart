import 'package:flutter/material.dart';
import '../Components/BottomNavBar.dart';
import 'Courses_and_Posts/Teacher_TabBar_CADP.dart';
import 'Teacher_Home_Page.dart';
import 'Teacher_Notes_Page.dart';
import 'Teacher_Notifications_Page.dart';

class TeacherStartPage extends StatefulWidget {
  const TeacherStartPage({super.key});

  static String id = '/TeacherStartPage';

  @override
  State<TeacherStartPage> createState() => _TeacherStartPageState();
}

class _TeacherStartPageState extends State<TeacherStartPage> {
  GlobalKey<ScaffoldState> formState = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> pages = const [
    TeacherHomePage(),
    TeacherNotificationsPage(),
    TeacherNotesPage(),
    TeacherTabBar()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: formState,
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
