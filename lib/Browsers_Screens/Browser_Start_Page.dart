import 'package:dtc_app/Components/Posts.dart';
import 'package:dtc_app/Constents/TextStyle.dart';
import 'package:flutter/material.dart';
import '../Components/BottomNavBar.dart';
import '../Constents/Colors.dart';
import 'Browser_Course_Page.dart';
import 'Browser_Home_Page.dart';
import 'Browser_Profile_Page.dart';
import 'Browser_Notifications_Page.dart';

class BrowserStartPage extends StatefulWidget {
  const BrowserStartPage({super.key});

  static String id = 'BrowserStartPage';

  @override
  State<BrowserStartPage> createState() => _BrowserStartPageState();
}

class _BrowserStartPageState extends State<BrowserStartPage> {
  @override
  TextEditingController? searchController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> Pages = const [
    BrowserHomePage(),
    NotificationsPage(),
    BrowserCoursePage()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: browserBottomNavBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
        body: Pages.elementAt(selectedIndex));
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
