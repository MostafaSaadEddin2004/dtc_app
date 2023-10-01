import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_Information_Page.dart';
import 'package:dtc_app/Teachers_Screens/Registration_Screens/Teacher_Information_Page.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import 'package:dtc_app/Students_Screens/Student_Start_Page.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Start_Page.dart';
import 'package:dtc_app/api/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  void checkUser() async {
    FirebaseHelper.init(context);
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    if (token == null) {
      Navigator.of(context).popAndPushNamed(
        SignUpType.id,
      );
      return;
    }
    final role = await AuthServices.getUserRole();
    if (role.name == 'student') {
      if (role.isRegistrationFinished) {
        Navigator.of(context).popAndPushNamed(
          StudentStartPage.id,
        );
      } else {
        Navigator.of(context).popAndPushNamed(
          AcceptanceQualification.id,
        );
      }
    } else if (role.name == 'teacher') {
      if (role.isRegistrationFinished) {
        Navigator.of(context).popAndPushNamed(
          TeacherAuthStartPage.id,
        );
      } else {
        Navigator.of(context).popAndPushNamed(
          TeacherAuthInformationPage.id,
        );
      }
    } else if (role.name == 'student_browser') {
      Navigator.of(context).popAndPushNamed(
        BrowserStartPage.id,
      );
    } else if (role.name == 'teacher_browser') {
      if (role.isRegistrationFinished) {
        Navigator.of(context).popAndPushNamed(
          TeacherStartPage.id,
        );
      } else {
        Navigator.of(context).popAndPushNamed(
          TeacherInformationPage.id,
        );
      }
    } else {
      print('We are in the start page');
    }
  }

  late double width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/DTC_LOGO.png'),
      nextScreen: const SignUpType(),
      animationDuration: const Duration(seconds: 2),
      centered: true,
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
