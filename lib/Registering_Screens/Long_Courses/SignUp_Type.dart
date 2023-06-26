import 'package:dtc_app/Browsers_Screens/Browser_Home_Page.dart';
import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:dtc_app/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Browsers_Screens/Browser_Start_Page.dart';

class SignUpType extends StatefulWidget {
  const SignUpType({super.key});

  static String id = 'SignUpType';

  @override
  State<SignUpType> createState() => _SignUpTypeState();
}

bool selectedb = false;
bool selecteds = false;

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
                selectedb = true;
                selecteds = false;
                setState(() {});
              },
              child: selectedb == false
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
                selecteds = true;
                selectedb = false;
                setState(() {});
              },
              child: selecteds == false
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
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                nextButton(
                    text: 'التالي',
                    onTap: () {
                      if (selectedb == true) {
                        if (selecteds == false) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            BrowserStartPage.id,
                            (Route<dynamic> route) => false,
                          );
                        }
                      } else {
                        if (selecteds == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AcceptanceQualifications.id,
                            (Route<dynamic> route) => false,
                          );
                        }
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
