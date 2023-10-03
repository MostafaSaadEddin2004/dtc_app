import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Start_Page.dart';
import 'package:dtc_app/blocs/get_user_information/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants/Colors.dart';
import 'Teacher_Profile_Notes_Page.dart';
import 'Teacher_Saved_Page.dart';
import 'Teacher_Privacy_Page.dart';

class TeacherProfilePage extends StatefulWidget {
  const TeacherProfilePage({super.key});
  static String id = '/TeacherProfilePage';

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popAndPushNamed(TeacherStartPage.id);
        return true;
      },
      child: DefaultTabController(
          length: 3,
          child: BlocProvider(
            create: (context) => GetUserInformationCubit()..fetchData(),
            child: Builder(builder: (context) {
              final state = BlocProvider.of<GetUserInformationCubit>(context,
                      listen: true)
                  .state;
              if (state is! GetUserInformationFetched) return Loading();
              final userData = state.userData;
              return Scaffold(
                  key: scaffoldKey,
                  appBar: AppBar(
                      backgroundColor: PrimaryColor,
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          backgroundColor: WhiteColor,
                          backgroundImage: NetworkImage(userData.image != null
                              ? userData.image!
                              : 'assets/images/person.png'),
                        ),
                      ),
                      title: Text(
                          userData.first_name_en + ' ' + userData.last_name_en),
                      bottom: const TabBar(
                        indicatorColor: WhiteColor,
                        unselectedLabelStyle: TextStyle(fontSize: 15),
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                              'الملاحظات',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'الخصوصية',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )),
                  body: const TabBarView(
                    children: [
                      // BrowserSettingsPage(),
                      TeacherSavedPage(),
                      TeacherProfileNotesPage(),
                      TeacherPrivacyPage()
                    ],
                  ));
            }),
          )),
    );
  }
}
