import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Browsers_Screens/Browser_Course_Page.dart';
import 'Browsers_Screens/Browser_Start_Page.dart';
import 'Browsers_Screens/Registration_Screens/Browser_SignIn_Screen.dart';
import 'Browsers_Screens/Registration_Screens/Browser_SignUp_Screen.dart';
import 'Constents/Colors.dart';
import 'SignUp_Type.dart';
import 'Start_App_Screens/Start_App_Screen.dart';
import 'Students_Screens/Courses_and_Posts/Student_TabBar_CADP.dart';
import 'Students_Screens/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'Students_Screens/Registering_Screens/Student_SignIn_Screen.dart';
import 'Students_Screens/Registering_Screens/Student_SignUp_Screen.dart';
import 'Students_Screens/Student_Start_Page.dart';
import 'Teachers_Auth_Screens/Adding_Posts.dart';
import 'Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_SignIn_Screen.dart';
import 'Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_SignUp_Screen.dart';
import 'Teachers_Auth_Screens/Teacher_Auth__Information_Page.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_SignIn_Screen.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_SignUp_Screen.dart';
import 'Teachers_Screens/Teacher_Information_Page.dart';
import 'Teachers_Screens/Teacher_Start_Page.dart';
void main() {
  runApp(const Main());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: PrimaryColor, // navigation bar color
    statusBarColor: PrimaryColor,
  ));
}
class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: const Locale('ar'),
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: const StartAppScreen(),
      routes: {
        SignUpType.id: (context) => const SignUpType(),
        BrowserSignInScreen.id: (context) => const BrowserSignInScreen(),
        BrowserSignUpScreen.id: (context) => const BrowserSignUpScreen(),
        BrowserStartPage.id: (context) => const BrowserStartPage(),
        BrowserCoursePage.id: (context) => const BrowserCoursePage(),
        StudentTabBar.id: (context) => const StudentTabBar(),
        StudentSignUpScreen.id: (context) => const StudentSignUpScreen(),
        StudentSignInScreen.id: (context) => const StudentSignInScreen(),
        AcceptanceQualifications.id: (context) =>
            const AcceptanceQualifications(),
        StudentStartPage.id: (context) => const StudentStartPage(),
        TeacherAuthSignUpScreen.id: (context) =>
            const TeacherAuthSignUpScreen(),
        TeacherAuthSignInScreen.id: (context) =>
            const TeacherAuthSignInScreen(),
        TeacherAuthInformationPage.id: (context) =>
            const TeacherAuthInformationPage(),
        TeacherAuthStartPage.id: (context) => const TeacherAuthStartPage(),
        TeacherSignUpScreen.id: (context) => const TeacherSignUpScreen(),
        TeacherSignInScreen.id: (context) => const TeacherSignInScreen(),
        TeacherInformationPage.id: (context) => const TeacherInformationPage(),
        TeacherStartPage.id: (context) => const TeacherStartPage(),
      },
    );
  }
}