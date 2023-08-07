import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Browsers_Screens/Registration_Screens/Browser_Name_SignUp_Screen.dart';
import 'Components/Buttons.dart';
import 'Constants/Colors.dart';
import 'Students_Screens/Registering_Screens/Student_Name_SignUp_Screen.dart';
import 'Teachers_Screens/Registration_Screens/Teacher_Name_SignUp_Screen.dart';

class SignUpType extends StatefulWidget {
  const SignUpType({super.key});

  static String id = 'SignUpType';

  @override
  State<SignUpType> createState() => _SignUpTypeState();
}

bool selectedBrowser = false;
bool selectedStudent = false;
bool selectedTeacher = false;

class _SignUpTypeState extends State<SignUpType> {
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
              'مرحباً بكم!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                selectedBrowser = true;
                selectedStudent = false;
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
                            FontAwesomeIcons.scroll,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الدخول كمتصفح',
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
                            FontAwesomeIcons.scroll,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الدخول كمتصفح',
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
                            'تسجيل الدخول كطالب',
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
                            'تسجيل الدخول كطالب',
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
                            FontAwesomeIcons.scroll,
                            size: 25,
                            color: GreyColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الدخول كأستاذ',
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
                            FontAwesomeIcons.scroll,
                            size: 25,
                            color: WhiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الدخول كأستاذ',
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
                          BrowserNameSignUpPage.id,
                          (Route<dynamic> route) => false,
                        );
                      } else if (selectedStudent == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          StudentNameSignUpPage.id,
                          (Route<dynamic> route) => false,
                        );
                      } else if (selectedTeacher == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          TeacherNameSignUpPage.id,
                          (Route<dynamic> route) => false,
                        );
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
