import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Browsers_Screens/Browser_Start_Page.dart';
import 'Constents/Colors.dart';
import 'Registering_Screens/Long_Courses/SignUp_Type.dart';
import 'Registering_Screens/SignIn_Screen.dart';
import 'Registering_Screens/SignUp_Screen.dart';
import 'Start_App_Screens/Start_App_Screen.dart';
import 'Students_Screens/Student_Start_Page.dart';
import 'Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
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
        StartAppScreen.id: (context) => const StartAppScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpType.id: (context) => const SignUpType(),
        AcceptanceQualifications.id: (context) =>
            const AcceptanceQualifications(),
        BrowserStartPage.id: (context) => const BrowserStartPage(),
        StudentStartPage.id: (context) => const StudentStartPage(),
        TeacherAuthStartPage.id:(context) => const TeacherAuthStartPage(),
        TeacherStartPage.id:(context) => const TeacherStartPage(),
      },
    );
  }
}
