import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Students_Screens/Student_Start_Page.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Start_Page.dart';
import 'package:dtc_app/api/firebase_helper.dart';
import 'package:dtc_app/api/models/auth_models.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/Buttons.dart';
import '../Constants/Colors.dart';
import 'SignUp_Type.dart';

class StartAppScreen extends StatefulWidget {
  const StartAppScreen({super.key});

  static String id = 'StartAppScreen';

  @override
  State<StartAppScreen> createState() => _StartAppScreenState();
}

class _StartAppScreenState extends State<StartAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  void checkUser() async {
    FirebaseHelper.init(context);
    final prefs = await SharedPreferences.getInstance();
    final role = await prefs.getString('role');
    final token = await prefs.getString('token');
    if (role == 'student' || token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        StudentStartPage.id,
        (Route<dynamic> route) => false,
      );
    } else if (role == 'teacher' || token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        TeacherAuthStartPage.id,
        (Route<dynamic> route) => false,
      );
    } else if (role == 'teacher_browser' || token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        TeacherStartPage.id,
        (Route<dynamic> route) => false,
      );
    } else if (role == 'student_browser' || token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        BrowserStartPage.id,
        (Route<dynamic> route) => false,
      );
    } else {
      print('We are in the start page');
    }
  }

  //  void checkUser({required String token, required String role}) {
  //   FutureBuilder(
  //       future: AuthServices.getUserRole(),
  //       builder: (context, snapshot) {
  //         final myRole = snapshot.data!;
  //         if (role == 'student' || token != null) {
  //           Navigator.of(context).pushNamedAndRemoveUntil(
  //             StudentStartPage.id,
  //             (Route<dynamic> route) => false,
  //           );
  //           return SizedBox();
  //         } else if (role == 'teacher' || token != null) {
  //           Navigator.of(context).pushNamedAndRemoveUntil(
  //             TeacherAuthStartPage.id,
  //             (Route<dynamic> route) => false,
  //           );
  //           return SizedBox();
  //         } else if (role == 'teacher_browser' || token != null) {
  //           Navigator.of(context).pushNamedAndRemoveUntil(
  //             TeacherStartPage.id,
  //             (Route<dynamic> route) => false,
  //           );
  //           return SizedBox();
  //         } else if (role == 'student_browser' || token != null) {
  //           Navigator.of(context).pushNamedAndRemoveUntil(
  //             BrowserStartPage.id,
  //             (Route<dynamic> route) => false,
  //           );
  //           return SizedBox();
  //         } else {
  //           print('We are in the start page');
  //           return SizedBox();
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 15, top: 80, right: 15, bottom: 30),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Image.asset(
                'assets/images/DTC_LOGO.png',
              )),
          const Text(
            "إنضم إلى رحلتنا",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: WhiteColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
                shadows: [
                  Shadow(
                      color: BlackColor, blurRadius: 10, offset: Offset(2, 2))
                ]),
          ),
          const Spacer(
            flex: 1,
          ),
          customButton(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                SignUpType.id,
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: PrimaryColor,
            fontSize: 24,
            text: 'البدء',
          ),
        ]),
      ),
    );
  }
}
