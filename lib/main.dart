import 'package:dtc_app/Browsers_Screens/Browser_Profile_Page.dart';
import 'package:dtc_app/Start_App_Screens/Splash_Screen_App.dart';
import 'package:dtc_app/Students_Screens/Student_Profile_Page.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_Information_Page.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_Name_SignUp_Screen.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_SignIn_Screen.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_SignUp_Screen.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Profile_Page.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Profile_Page.dart';
import 'package:dtc_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'Browsers_Screens/Browser_Course_Page.dart';
import 'Browsers_Screens/Browser_Start_Page.dart';
import 'Browsers_Screens/Registration_Screens/Browser_Name_SignUp_Screen.dart';
import 'Browsers_Screens/Registration_Screens/Browser_SignIn_Screen.dart';
import 'Browsers_Screens/Registration_Screens/Browser_SignUp_Screen.dart';
import 'Browsers_Screens/Registration_Screens/Short_Course/Browser_Other_Information.dart';
import 'Browsers_Screens/Registration_Screens/Short_Course/Browser_Personal_Information.dart';
import 'Browsers_Screens/Registration_Screens/browser_profile_image.dart';
import 'Constants/Colors.dart';
import 'Start_App_Screens/SignUp_Type.dart';
import 'Students_Screens/Courses_and_Posts/Student_TabBar_CADP.dart';
import 'Students_Screens/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'Students_Screens/Registering_Screens/Short_Courses/Student_Personal_Information.dart';
import 'Students_Screens/Registering_Screens/Student_Name_SignUp_Screen.dart';
import 'Students_Screens/Registering_Screens/Student_SignIn_Screen.dart';
import 'Students_Screens/Registering_Screens/Student_SignUp_Screen.dart';
import 'Students_Screens/Registering_Screens/student_profile_image.dart';
import 'Students_Screens/Student_Editing_Notes.dart';
import 'Students_Screens/Student_Start_Page.dart';
import 'Teachers_Auth_Screens/Editing_Posts.dart';
import 'Teachers_Auth_Screens/Teacher_Auh__Editing_Notes.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_Name_SignUp_Screen.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_SignIn_Screen.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_SignUp_Screen.dart';
import 'Teachers_Screens/Teacher_Editing_Notes.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_Information_Page.dart';
import 'Teachers_Screens/Teacher_Start_Page.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    var client = super.createHttpClient(context);
    client.connectionTimeout = Duration(seconds: 30);
    return client;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Main());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: PrimaryColor, // navigation bar color
    statusBarColor: PrimaryColor,
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
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
      home: const SplashScreen(),
      routes: {
        SignUpType.id: (context) => const SignUpType(),
        BrowserNameSignUpPage.id: (context) => const BrowserNameSignUpPage(),
        BrowserSignInScreen.id: (context) => const BrowserSignInScreen(),
        BrowserSignUpScreen.id: (context) => const BrowserSignUpScreen(),
        BrowserProfileImage.id: (context) => const BrowserProfileImage(),
        BrowserStartPage.id: (context) => const BrowserStartPage(),
        BrowserProfilePage.id: (context) => const BrowserProfilePage(),
        BrowserCoursePage.id: (context) => const BrowserCoursePage(),
        BrowserPersonalInformation.id: (context) =>
            const BrowserPersonalInformation(),
        BrowserOtherInformation.id: (context) =>
            const BrowserOtherInformation(),
        StudentSignUpScreen.id: (context) => const StudentSignUpScreen(),
        StudentSignInScreen.id: (context) => const StudentSignInScreen(),
        StudentNameSignUpPage.id: (context) => const StudentNameSignUpPage(),
        StudentProfileImage.id: (context) => const StudentProfileImage(),
        AcceptanceQualification.id: (context) =>
            const AcceptanceQualification(),
        StudentStartPage.id: (context) => const StudentStartPage(),
        StudentProfilePage.id: (context) => const StudentProfilePage(),
        StudentTabBar.id: (context) => const StudentTabBar(),
        StudentEditingNotes.id: (context) => const StudentEditingNotes(),
        StudentPersonalInformation.id: (context) =>
            const StudentPersonalInformation(),
        TeacherAuthSignUpScreen.id: (context) =>
            const TeacherAuthSignUpScreen(),
        TeacherAuthNameSignUpPage.id: (context) =>
            const TeacherAuthNameSignUpPage(),
        TeacherAuthInformationPage.id: (context) =>
            const TeacherAuthInformationPage(),
        TeacherAuthSignInScreen.id: (context) =>
            const TeacherAuthSignInScreen(),
        TeacherAuthStartPage.id: (context) => const TeacherAuthStartPage(),
        TeacherAuthProfilePage.id: (context) => const TeacherAuthProfilePage(),
        TeacherAuthEditingNotes.id: (context) =>
            const TeacherAuthEditingNotes(),
        EditingPostPage.id: (context) => const EditingPostPage(),
        TeacherNameSignUpPage.id: (context) => const TeacherNameSignUpPage(),
        TeacherSignUpScreen.id: (context) => const TeacherSignUpScreen(),
        TeacherSignInScreen.id: (context) => const TeacherSignInScreen(),
        TeacherInformationPage.id: (context) => const TeacherInformationPage(),
        TeacherStartPage.id: (context) => const TeacherStartPage(),
        TeacherProfilePage.id: (context) => const TeacherProfilePage(),
        TeacherEditingNotes.id: (context) => const TeacherEditingNotes(),
      },
    );
  }
}
