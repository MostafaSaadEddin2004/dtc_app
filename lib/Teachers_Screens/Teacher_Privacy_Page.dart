import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../Components/Dialogs.dart';
import '../Components/PrivacySettings.dart';
import '../Constants/Controller.dart';
import 'Teacher_ChangePassword.dart';

class TeacherPrivacyPage extends StatefulWidget {
  const TeacherPrivacyPage({super.key});
  static String id = 'TeacherPrivacyPage';

  @override
  State<TeacherPrivacyPage> createState() => _TeacherPrivacyPageState();
}

class _TeacherPrivacyPageState extends State<TeacherPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: AuthServices.getUserInformation(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final user = snapshot.data!;
              teacherPrivacyEditingPhone.text = user.phone;
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        privacyEditing(
                            icon: Icons.call,
                            label: 'رقم الهاتف',
                            onPressedIconButton: () {
                              showDialog(
                                context: context,
                                builder: (context) => editingPrivacyDialog(
                                    controller: browserPrivacyEditingPhone,
                                    validator: (text) {
                                      if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                          .hasMatch(text!)) {
                                        return 'الرجاء التأكد من رقم الجوال';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    onCancelPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    onOkPressed: () {
                                      AuthServices.postChangePassword(
                                          phone:
                                              studentPrivacyEditingPhone.text);
                                              Navigator.of(context).pop();
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
                                      const TeacherChangePasswordEnterPassword()));
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
                                    controller: teacherPrivacyEditingLocation,
                                    validator: (text) {
                                      if (text!.length < 3) {
                                        return 'الموقع يجب أن يكون 3 أحرف على الأقل';
                                      }
                                      return null;
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
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
