import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Start_App_Screens/Start_App_Screen.dart';
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

  late double width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/DTC_LOGO.png'),
      nextScreen: const StartAppScreen(),
      animationDuration: const Duration(seconds: 2),
      centered: true,
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
