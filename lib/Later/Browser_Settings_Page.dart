import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'Browser_Language_Page.dart';
import 'Browser_Notification_Settings_Page.dart';

class BrowserSettingsPage extends StatefulWidget {
  const BrowserSettingsPage({super.key});
  static String id = 'BrowserSettingsPage';

  @override
  State<BrowserSettingsPage> createState() => _BrowserSettingsPageState();
}

class _BrowserSettingsPageState extends State<BrowserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BrowserLanguagePage.id);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.language,
                  color: BlackColor,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Language',
                  style: TextStyle(
                      color: BlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(BrowserNotificationSettingsPage.id);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.notifications,
                  color: BlackColor,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Notifications Settings',
                  style: TextStyle(
                      color: BlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.people,
                  color: BlackColor,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Invite a Friend',
                  style: TextStyle(
                      color: BlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print('Signed out');
            },
            child: Row(
              children: const [
                Text(
                  'Sign out',
                  style: TextStyle(
                      color: RedColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.exit_to_app_rounded,
                  color: RedColor,
                  size: 30,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
