import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Students_Screens/Student_Start_Page.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_SignUp_Screen.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Teacher_Auth_Start_Page.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Start_Page.dart';
import 'package:dtc_app/api/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Browsers_Screens/Registration_Screens/Browser_SignUp_Screen.dart';
import '../Components/Buttons.dart';
import '../Constants/Colors.dart';
import '../Students_Screens/Registering_Screens/Student_SignUp_Screen.dart';
import '../Teachers_Screens/Registration_Screens/Teacher_SignUp_Screen.dart';

class SignUpType extends StatefulWidget {
  const SignUpType({super.key});

  static String id = 'SignUpType';

  @override
  State<SignUpType> createState() => _SignUpTypeState();
}

bool selectedBrowser = false;
bool selectedStudent = false;
bool selectedTeacherAuth = false;
bool selectedTeacher = false;

class _SignUpTypeState extends State<SignUpType> {
  // void initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   FirebaseHelper.init(context);
  //   FirebaseHelper.createToken().then(print);
  //   // void checkUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final role = await prefs.getString('role');
  //   final token = await prefs.getString('token');
  //   if (role == 'student' || token != null) {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       StudentStartPage.id,
  //       (Route<dynamic> route) => false,
  //     );
  //   } else if (role == 'teacher' || token != null) {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       TeacherAuthStartPage.id,
  //       (Route<dynamic> route) => false,
  //     );
  //   } else if (role == 'teacher_browser' || token != null) {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       TeacherStartPage.id,
  //       (Route<dynamic> route) => false,
  //     );
  //   } else if (role == 'student_browser' || token != null) {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       BrowserStartPage.id,
  //       (Route<dynamic> route) => false,
  //     );
  //   } else {
  //     print('We are in the start page');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 75, top: 80, right: 75, bottom: 20),
              child: Image.asset('assets/images/DTC_LOGO.png'),
            ),
            const Text(
              'إختر نوع تسجيل الدخول',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                selectedBrowser = true;
                selectedStudent = false;
                selectedTeacherAuth = false;
                selectedTeacher = false;
                setState(() {});
              },
              child: selectedBrowser == false
                  ? Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: GreyColor, width: 1)),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.person,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'زائر',
                            style: TextStyle(fontSize: 18, color: GreyColor),
                          )
                        ],
                      ))
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: GreyColor,
                            blurRadius: 4,
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.person,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'زائر',
                            style: TextStyle(fontSize: 18, color: WhiteColor),
                          )
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                selectedBrowser = false;
                selectedStudent = true;
                selectedTeacherAuth = false;
                selectedTeacher = false;
                setState(() {});
              },
              child: selectedStudent == false
                  ? Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: GreyColor, width: 1),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.userGraduate,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'طالب',
                            style: TextStyle(fontSize: 18, color: GreyColor),
                          )
                        ],
                      ))
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: GreyColor,
                            blurRadius: 4,
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.userGraduate,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'طالب',
                            style: TextStyle(fontSize: 18, color: WhiteColor),
                          )
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                selectedBrowser = false;
                selectedStudent = false;
                selectedTeacher = true;
                selectedTeacherAuth = false;
                setState(() {});
              },
              child: selectedTeacher == false
                  ? Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: GreyColor, width: 1),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.chalkboardTeacher,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'أستاذ',
                            style: TextStyle(fontSize: 18, color: GreyColor),
                          )
                        ],
                      ))
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: GreyColor,
                            blurRadius: 4,
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.chalkboardTeacher,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'أستاذ',
                            style: TextStyle(fontSize: 18, color: WhiteColor),
                          )
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                selectedBrowser = false;
                selectedStudent = false;
                selectedTeacher = false;
                selectedTeacherAuth = true;
                setState(() {});
              },
              child: selectedTeacherAuth == false
                  ? Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: GreyColor, width: 1),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.chalkboardTeacher,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'رئيس قسم',
                            style: TextStyle(fontSize: 18, color: GreyColor),
                          )
                        ],
                      ))
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: GreyColor,
                            blurRadius: 4,
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.chalkboardTeacher,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'رئيس قسم',
                            style: TextStyle(fontSize: 18, color: WhiteColor),
                          )
                        ],
                      ),
                    ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                nextButton(
                    text: 'التالي',
                    onTap: () {
                      if (selectedBrowser == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          BrowserSignUpScreen.id,
                          (Route<dynamic> route) => false,
                        );
                      } else if (selectedStudent == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          StudentSignUpScreen.id,
                          (Route<dynamic> route) => false,
                        );
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          TeacherSignUpScreen.id,
                          (Route<dynamic> route) => false,
                        );
                      } else if (selectedTeacherAuth == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          TeacherAuthSignUpScreen.id,
                          (Route<dynamic> route) => false,
                        );
                      } else if (selectedTeacher == true) {
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
