import 'package:dtc_app/Components/Label.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:dtc_app/Constents/TextStyle.dart';
import 'package:flutter/material.dart';

import 'Student_Notification_Tone_Page.dart';

class StudentNotificationSettingsPage extends StatefulWidget {
  const StudentNotificationSettingsPage({super.key});
  static String id = 'BrowserNotificationSettingsPage';

  @override
  State<StudentNotificationSettingsPage> createState() =>
      _StudentNotificationSettingsPageState();
}

class _StudentNotificationSettingsPageState
    extends State<StudentNotificationSettingsPage> {
  bool switched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: labelFont(text: 'Notification Settings'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            decoration: const BoxDecoration(color: WhiteColor, boxShadow: [
              BoxShadow(color: GreyColor, offset: Offset(2, 2), blurRadius: 2)
            ]),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelFont(text: 'Notification Tone'),
                        bodyText(text: 'Turning on Tone')
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Switch(
                      activeColor: PrimaryColor,
                      value: switched,
                      onChanged: (switchChange) {
                        setState(() {
                          switched = switchChange;
                        });
                      },
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                'Messages',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(StudentNotificationTonePage.id);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: GreyColor, width: 1)),
                  color: WhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: GreyColor, offset: Offset(2, 2), blurRadius: 2)
                  ]),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelFont(text: 'Notification Tone'),
                      bodyText(text: 'Default (Tone Name)')
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: GreyColor, width: 0.5)),
                  color: WhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: GreyColor, offset: Offset(2, 2), blurRadius: 2)
                  ]),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelFont(text: 'Vibration'),
                      bodyText(text: 'Default')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
