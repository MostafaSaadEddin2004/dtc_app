import 'package:dtc_app/Browsers_Screens/Browser_Profile_Page.dart';
import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Start_App_Screens/SignUp_Type.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'package:dtc_app/api/services/academic_registraion_service.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/blocs/get_user_information/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/BottomNavBar.dart';
import 'Browser_Course_Page.dart';
import 'Browser_Home_Page.dart';
import 'Browser_Notifications_Page.dart';

class BrowserStartPage extends StatefulWidget {
  const BrowserStartPage({super.key});

  static String id = '/BrowserStartPage';

  @override
  State<BrowserStartPage> createState() => _BrowserStartPageState();
}

class _BrowserStartPageState extends State<BrowserStartPage> {
  TextEditingController? searchController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> Pages = const [
    BrowserHomePage(),
    NotificationsPage(),
    BrowserCoursePage()
  ];

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserInformationCubit()..fetchData(),
      child: Builder(builder: (context) {
        final state =
            BlocProvider.of<GetUserInformationCubit>(context, listen: true)
                .state;
        if (state is! GetUserInformationFetched) return Loading();
        final userData = state.userData;
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(backgroundColor: PrimaryColor),
            drawer: Drawer(
                backgroundColor: PrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
                  child: Column(children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed(BrowserProfilePage.id);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: WhiteColor,
                            backgroundImage: NetworkImage(userData.image != null
                                ? userData.image!
                                : 'assets/images/person.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              userData.first_name_en.toString() +
                                  ' ' +
                                  userData.last_name_en.toString(),
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              userData.email.toString(),
                              style: TextStyle(
                                color: WhiteColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: WhiteColor, thickness: 2),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        int? statusCode;
                        await AcademicRegistrationService
                            .getAcademicRegistrationIsOpen(
                          getStatus: (statusCodeF) => statusCode = statusCodeF,
                        );
                        if (statusCode! >= 200 && statusCode! < 300) {
                          Navigator.of(context)
                              .pushReplacementNamed(AcceptanceQualification.id);
                        } else {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: ((context) => warningDialog(
                                  title: 'إنتباه',
                                  message:
                                      'عذراً، لقد إنتهى وقت التسجيل على المفاضلة.',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })));
                        }
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.assignment_ind,
                            color: WhiteColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'التسجيل كطالب',
                            style: TextStyle(
                                color: WhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthServices.postLogout();
                        Navigator.of(context).pushReplacementNamed(
                          SignUpType.id,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: RedColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                color: RedColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
                )),
            bottomNavigationBar: browserBottomNavBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
            body: Pages.elementAt(selectedIndex));
      }),
    );
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
