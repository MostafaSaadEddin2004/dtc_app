import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';
import 'Teacher_Auth_Profile_Notes_Page.dart';
import 'Teacher_Auth_Saved_Page.dart';
import 'Teacher_Auth_Privacy_Page.dart';

class TeacherAuthProfilePage extends StatefulWidget {
  const TeacherAuthProfilePage({super.key});
  static String id = 'TeacherAuthProfilePage';

  @override
  State<TeacherAuthProfilePage> createState() => _TeacherAuthProfilePageState();
}

class _TeacherAuthProfilePageState extends State<TeacherAuthProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: scaffoldKey,
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
                indicatorColor: WhiteColor,
                unselectedLabelStyle: TextStyle(fontSize: 15),
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                tabs: [
                  // Tab(
                  //   child: Text('Settings'),
                  // ),
                  Tab(
                    child: Text('المحفوظات'),
                  ),
                  Tab(
                    child: Text('الملاحظات'),
                  ),
                  Tab(
                    child: Text('الخصوصية'),
                  ),
                ],
              )),
          body: const TabBarView(
            children: [
              // BrowserSettingsPage(),
              TeacherAuthSavedPage(),
              TeacherAuthProfileNotesPage(),
              TeacherAuthPrivacyPage()
            ],
          )),
    );
  }
}
