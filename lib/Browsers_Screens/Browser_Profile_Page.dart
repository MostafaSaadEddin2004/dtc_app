import 'package:dtc_app/Browsers_Screens/Browser_Settings_Page.dart';
import 'package:flutter/material.dart';

import '../Constents/Colors.dart';
import '../Constents/TextStyle.dart';
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
      length: 2,
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
                    child: Text('المحفوظات'),
                  ),
                  Tab(
                    child: Text('الخصوصية'),
                  ),
                ],
              )),
          body: const TabBarView(
            children: [
              // BrowserSettingsPage(),
              BrowserSavedPage(),
              BrowserPrivacyPage()
            ],
          )),
    );
  }
}
