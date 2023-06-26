import 'package:flutter/material.dart';

import '../Components/PrivacySettings.dart';
import '../Constents/Colors.dart';

class BrowserPrivacyPage extends StatefulWidget {
  const BrowserPrivacyPage({super.key});
  static String id = 'BrowserPrivacyPage';

  @override
  State<BrowserPrivacyPage> createState() => _BrowserPrivacyPageState();
}

class _BrowserPrivacyPageState extends State<BrowserPrivacyPage> {
  List privacyValues = const [
    {
      'PrefixIcon': Icons.call,
      'PrefixIconColor': BlackColor,
      'SuffixIcon': Icons.edit,
      'SuffixIconColor': BlackColor,
      'SuffixIconSize': 20.0,
      'IsValueTrue': true,
      'Value': 'Phone Number',
      'Label': 'Phone Number',
      'LabelColor': BlackColor,
      'Color': WhiteColor
    },
    {
      'PrefixIcon': Icons.person,
      'PrefixIconColor': BlackColor,
      'SuffixIcon': Icons.edit,
      'SuffixIconColor': BlackColor,
      'SuffixIconSize': 20.0,
      'IsValueTrue': true,
      'Value': 'User Name',
      'Label': 'User Name',
      'LabelColor': BlackColor,
      'Color': WhiteColor
    },
    {
      'PrefixIcon': Icons.lock,
      'PrefixIconColor': BlackColor,
      'SuffixIcon': Icons.edit,
      'SuffixIconColor': BlackColor,
      'SuffixIconSize': 20.0,
      'IsValueTrue': true,
      'Value': 'Password',
      'Label': 'Password',
      'LabelColor': BlackColor,
      'Color': WhiteColor
    },
    {
      'PrefixIcon': Icons.location_on,
      'PrefixIconColor': BlackColor,
      'SuffixIcon': Icons.edit,
      'SuffixIconColor': BlackColor,
      'SuffixIconSize': 20.0,
      'IsValueTrue': true,
      'Value': 'Location',
      'Label': 'Location',
      'LabelColor': BlackColor,
      'Color': WhiteColor
    }
  ];

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
                    onPressedIconButton: () {},
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
