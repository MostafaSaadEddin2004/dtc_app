import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';
import 'Browser_Notification_Tone_Page.dart';

class BrowserNotificationSettingsPage extends StatefulWidget {
  const BrowserNotificationSettingsPage({super.key});
  static String id = '/BrowserNotificationSettingsPage';

  @override
  State<BrowserNotificationSettingsPage> createState() =>
      _BrowserNotificationSettingsPageState();
}

class _BrowserNotificationSettingsPageState
    extends State<BrowserNotificationSettingsPage> {
  bool switched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('Notification Settings'),
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
              Navigator.of(context).pushNamed(BrowserTonePage.id);
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
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
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
