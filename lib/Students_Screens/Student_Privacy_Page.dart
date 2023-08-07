import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import '../Components/Dialogs.dart';
import '../Components/PrivacySettings.dart';
import '../Constants/Controller.dart';
import 'Editing_Marks_Request_Page.dart';
import 'Moving_Request_Page.dart';
import 'Student_ChangePassword.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StudentPrivacyPage extends StatefulWidget {
  const StudentPrivacyPage({super.key});
  static String id = 'StudentPrivacyPage';

  @override
  State<StudentPrivacyPage> createState() => _StudentPrivacyPageState();
}

class _StudentPrivacyPageState extends State<StudentPrivacyPage> {
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
                  onPressedIconButton: () {
                    showDialog(
                      context: context,
                      builder: (context) => editingPrivacyDialog(
                          controller: studentPrivacyEditingPhone,
                          onChanged: (text) {},
                          validator: (text) {
                            if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                .hasMatch(text!)) {
                              return 'الرجاء التأكد من رقم الجوال';
                            }
                          },
                          keyboardType: TextInputType.number,
                          onCancelPressed: () {
                            Navigator.of(context).pop();
                          },
                          onOkPressed: () {
                            print('not null');
                          },
                          prefixIcon: Icons.call,
                          title: 'رقم الهاتف',
                          hint: 'أدخل رقم الهاتف'),
                    );
                  },
                  value: 'رقم الهاتف'),
              const SizedBox(
                height: 15,
              ),
              privacyEditing(
                  icon: Icons.lock,
                  label: 'كلمة السر',
                  onPressedIconButton: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const StudentChangePasswordEnterPassword(),
                    ));
                  },
                  value: 'كلمة السر'),
              const SizedBox(
                height: 15,
              ),
              privacyEditing(
                  icon: Icons.location_on,
                  label: 'الموقع',
                  onPressedIconButton: () {
                    showDialog(
                      context: context,
                      builder: (context) => editingPrivacyDialog(
                          controller: studentPrivacyEditingLocation,
                          onChanged: (text) {},
                          validator: (text) {
                            if (text!.length < 3) {
                              return 'الموقع يجب أن يكون 3 أحرف على الأقل';
                            }
                          },
                          keyboardType: TextInputType.name,
                          onCancelPressed: () {
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          onOkPressed: () {},
                          prefixIcon: Icons.location_on,
                          title: 'الموقع',
                          hint: 'أدخل الموقع'),
                    );
                  },
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
