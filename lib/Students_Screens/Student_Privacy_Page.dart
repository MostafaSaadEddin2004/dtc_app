import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  static String id = '/StudentPrivacyPage';

  @override
  State<StudentPrivacyPage> createState() => _StudentPrivacyPageState();
}

class _StudentPrivacyPageState extends State<StudentPrivacyPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: FutureBuilder(
              future: AuthServices.getUserInformation(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final user = snapshot.data!;
                studentPrivacyEditingPhone.text = user.phone;
                studentPrivacyEditingLocation.text = user.first_name_ar;
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
                                      key: formKey,
                                      controller: studentPrivacyEditingPhone,
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
                                        studentPrivacyEditingPhone.text =
                                            user.phone;
                                      },
                                      onOkPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          isLoading = true;
                                          AuthServices.postEditProfile(
                                              phone: studentPrivacyEditingPhone
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
                              value: user.phone),
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
                              value: ''),
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
                                      key: formKey,
                                      controller: studentPrivacyEditingLocation,
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
                                        if (formKey.currentState!.validate()) {
                                          isLoading = true;
                                          AuthServices.postEditProfile(
                                              address:
                                                  studentPrivacyEditingLocation
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
                              value: user.first_name_ar),
                          const SizedBox(
                            height: 15,
                          ),
                          studentRequests(
                            onPressedIconButton: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const MovingRequestPage())));
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
                                  builder: ((context) =>
                                      const EditingMarksRequestPage())));
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
                );
              })),
    );
  }
}
