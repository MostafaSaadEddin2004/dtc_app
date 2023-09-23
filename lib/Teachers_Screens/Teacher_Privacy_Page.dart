import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Teachers_Screens/Teacher_Start_Page.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Dialogs.dart';
import '../Components/PrivacySettings.dart';
import '../Constants/Controller.dart';
import 'Teacher_ChangePassword.dart';

class TeacherPrivacyPage extends StatefulWidget {
  const TeacherPrivacyPage({super.key});
  static String id = '/TeacherPrivacyPage';

  @override
  State<TeacherPrivacyPage> createState() => _TeacherPrivacyPageState();
}

class _TeacherPrivacyPageState extends State<TeacherPrivacyPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popAndPushNamed(TeacherStartPage.id);
        return true;
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
            body: FutureBuilder(
                future: AuthServices.getUserInformation(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || !mounted) return Loading();
                  final user = snapshot.data!;
                  teacherPrivacyEditingPhone.text = user.phone;
                  teacherPrivacyEditingLocation.text = user.first_name_ar;
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
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => editingPrivacyDialog(
                                        key: formKey,
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
                                          teacherPrivacyEditingPhone.text =
                                              user.phone;
                                        },
                                        onOkPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            isLoading = true;
                                            AuthServices.postEditProfile(
                                                phone:
                                                    studentPrivacyEditingPhone
                                                        .text);
                                            isLoading = false;
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          }
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
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => editingPrivacyDialog(
                                        key: formKey,
                                        controller:
                                            teacherPrivacyEditingLocation,
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
                                        onOkPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            isLoading = true;
                                            AuthServices.postEditProfile(
                                                address:
                                                    teacherPrivacyEditingLocation
                                                        .text);
                                            isLoading = false;
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          }
                                        },
                                        prefixIcon: Icons.location_on,
                                        title: 'الموقع',
                                        hint: 'أدخل الموقع'),
                                  );
                                },
                                value: user.last_name_ar),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
