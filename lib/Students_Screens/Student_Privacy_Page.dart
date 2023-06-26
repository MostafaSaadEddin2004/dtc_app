import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';

import '../Components/PrivacySettings.dart';
import 'Editing_Marks_Request_Page.dart';
import 'Moving_Request_Page.dart';

class StudentPrivacyPage extends StatefulWidget {
  const StudentPrivacyPage({super.key});
  static String id = 'StudentPrivacyPage';

  @override
  State<StudentPrivacyPage> createState() => _StudentPrivacyPageState();
}

class _StudentPrivacyPageState extends State<StudentPrivacyPage> {
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
      'Color': WhiteColor,
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
    },
    {
      'PrefixIcon': Icons.move_up_rounded,
      'PrefixIconColor': WhiteColor,
      'SuffixIcon': Icons.arrow_circle_right_rounded,
      'SuffixIconColor': WhiteColor,
      'SuffixIconSize': 40.0,
      'IsValueTrue': false,
      'Value': '',
      'Label': 'Move Request',
      'LabelColor': WhiteColor,
      'Color': PrimaryColor
    },
    {
      'PrefixIcon': Icons.edit_document,
      'PrefixIconColor': WhiteColor,
      'SuffixIcon': Icons.arrow_circle_right_rounded,
      'SuffixIconColor': WhiteColor,
      'SuffixIconSize': 40.0,
      'IsValueTrue': false,
      'Value': '',
      'Label': 'Edit Marks Request',
      'LabelColor': WhiteColor,
      'Color': PrimaryColor
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
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
              const SizedBox(
                height: 15,
              ),
              studentRequests(
                onPressedIconButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const MovingRequestPage())));
                },
                prefixIcon: Icons.move_up_rounded,
                prefixIconColor: WhiteColor,
                suffixIcon: Icons.arrow_circle_left_rounded,
                suffixIconColor: WhiteColor,
                suffixIconSize: 40,
                label: 'طلب انتقال',
                labelColor: WhiteColor,
              ),
              const SizedBox(
                height: 15,
              ),
              studentRequests(
                onPressedIconButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const EditingMarksRequestPage())));
                },
                prefixIcon: Icons.edit_document,
                prefixIconColor: WhiteColor,
                suffixIcon: Icons.arrow_circle_left_rounded,
                suffixIconColor: WhiteColor,
                suffixIconSize: 40,
                label: 'طلب تعديل علامات',
                labelColor: WhiteColor,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
