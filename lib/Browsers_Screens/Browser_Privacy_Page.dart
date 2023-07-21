import 'package:flutter/material.dart';

import '../Components/PrivacySettings.dart';
import '../Constents/Colors.dart';
import 'Browser_ChangePassword.dart';

class BrowserPrivacyPage extends StatefulWidget {
  const BrowserPrivacyPage({super.key});
  static String id = 'BrowserPrivacyPage';

  @override
  State<BrowserPrivacyPage> createState() => _BrowserPrivacyPageState();
}

class _BrowserPrivacyPageState extends State<BrowserPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              children: [
                privacyEditing(
                    icon: Icons.call,
                    label: 'رقم الهاتف',
                    onPressedIconButton: () {},
                    value: 'رقم الهاتف'),
                const SizedBox(
                  height: 15,
                ),
                privacyEditing(
                    icon: Icons.person,
                    label: 'اسم المستخدم',
                    onPressedIconButton: () {},
                    value: 'اسم المستخدم'),
                const SizedBox(
                  height: 15,
                ),
                privacyEditing(
                    icon: Icons.lock,
                    label: 'كلمة السر',
                    onPressedIconButton: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const BrowserChangePasswordEnterPassword(),
                      ));
                    },
                    value: 'كلمة السر'),
                const SizedBox(
                  height: 15,
                ),
                privacyEditing(
                    icon: Icons.location_on,
                    label: 'الموقع',
                    onPressedIconButton: () {},
                    value: 'الموقع'),
              ],
            )),
      ),
    );
  }
}
