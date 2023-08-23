import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';
import 'Browser_MyCourses_Page.dart';
import 'Browser_Saved_Page.dart';
import 'Browser_Privacy_Page.dart';

class BrowserProfilePage extends StatefulWidget {
  const BrowserProfilePage({super.key});
  static String id = 'BrowserProfilePage';

  @override
  State<BrowserProfilePage> createState() => _BrowserProfilePageState();
}

class _BrowserProfilePageState extends State<BrowserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: PrimaryColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: CircleAvatar(
                  backgroundColor: WhiteColor,
                  child: Icon(
                    Icons.person,
                    color: PrimaryColor,
                  ),
                ),
              ),
              title: const Text('اسم المستخدم'),
              bottom: const TabBar(
                dividerColor: BlackColor,
                indicatorColor: WhiteColor,
                unselectedLabelStyle: TextStyle(fontSize: 15),
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                tabs: [
                  // Tab(
                  //   child: Text('Settings'),
                  // ),
                  Tab(
                    child: Text(
                      'المحفوظات',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الخصوصية',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'دوراتي',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              )),
          body: const TabBarView(
            children: [
              // BrowserSettingsPage(),
              BrowserSavedPage(),
              BrowserPrivacyPage(),
              BrowserMyCoursesPage()
            ],
          )),
    );
  }
}
