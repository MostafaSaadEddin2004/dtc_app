import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import 'Browser_Saved_Page.dart';
import 'Browser_Privacy_Page.dart';

class BrowserProfilePage extends StatefulWidget {
  const BrowserProfilePage({super.key});
  static String id = '/BrowserProfilePage';

  @override
  State<BrowserProfilePage> createState() => _BrowserProfilePageState();
}

class _BrowserProfilePageState extends State<BrowserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).popAndPushNamed(BrowserStartPage.id);
          return true;
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  backgroundColor: PrimaryColor,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: FutureBuilder(
                        future: AuthServices.getUserInformation(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData || !mounted) return Loading();
                          final user = snapshot.data!;
                          return CircleAvatar(
                              backgroundColor: WhiteColor,
                              child: user.image == null
                                  ? Icon(
                                      Icons.person,
                                      color: PrimaryColor,
                                    )
                                  : Image.network(user.image!));
                        }),
                  ),
                  title: FutureBuilder(
                      future: AuthServices.getUserInformation(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || !mounted) return Loading();
                        final user = snapshot.data!;
                        return Text(
                            user.first_name_en + ' ' + user.last_name_en);
                      }),
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
                      // Tab(
                      //   child: Text(
                      //     'دوراتي',
                      //     style: TextStyle(fontSize: 14),
                      //   ),
                      // ),
                    ],
                  )),
              body: TabBarView(
                children: [
                  // BrowserSettingsPage(),
                  BrowserSavedPage(),
                  BrowserPrivacyPage(),
                  // BrowserMyCoursesPage()
                ],
              )),
        ));
  }
}
