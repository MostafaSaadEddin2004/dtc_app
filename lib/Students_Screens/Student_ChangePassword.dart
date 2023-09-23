import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';

class StudentChangePasswordEnterPassword extends StatefulWidget {
  const StudentChangePasswordEnterPassword({super.key});

  @override
  State<StudentChangePasswordEnterPassword> createState() =>
      _StudentChangePasswordEnterPasswordState();
}

class _StudentChangePasswordEnterPasswordState
    extends State<StudentChangePasswordEnterPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool currentSecure = false;
  bool newSecure = false;
  bool confirmSecure = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'تغيير كلمة السر'),
        body: Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customTextField(
                      onChanged: (data) {},
                      hint: 'أدخل كلمة المرور الحالية',
                      controller: studentCurrentPassword,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'كلمة المرور الحالية مطلوبة';
                        } else if (text.length < 8) {
                          return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                        }
                        return null;
                      },
                      labelText: 'كلمة المرور الحالية',
                      obscure: !currentSecure,
                      prefix: Icons.lock,
                      suffix: IconButton(
                        icon: Icon(
                          currentSecure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            currentSecure = !currentSecure;
                          });
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      radius: 20,
                      padding: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customTextField(
                      onChanged: (data) {},
                      hint: 'أدخل كلمة المرور الجديدة',
                      controller: studentNewPassword,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        } else if (text.length < 8) {
                          return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                        }
                        return null;
                      },
                      labelText: 'كلمة المرور الجديدة',
                      obscure: !newSecure,
                      prefix: Icons.lock,
                      suffix: IconButton(
                        icon: Icon(
                          newSecure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            newSecure = !newSecure;
                          });
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      radius: 20,
                      padding: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customTextField(
                      onChanged: (data) {},
                      hint: 'أكد كلمة المرور الجديدة',
                      controller: studentConfirmPassword,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        } else if (text.length < 8) {
                          return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                        } else if (studentConfirmPassword.text !=
                            studentNewPassword.text) {
                          return 'كلمة المرور غير متطابقة';
                        }
                        return null;
                      },
                      labelText: 'تأكيد كلمة المرور',
                      obscure: !confirmSecure,
                      prefix: Icons.lock,
                      suffix: IconButton(
                        icon: Icon(
                          confirmSecure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            confirmSecure = !confirmSecure;
                          });
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      radius: 20,
                      padding: 15),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    nextButton(
                        text: 'التالي',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            final error = await AuthServices.postEditProfile(
                                current_password: studentCurrentPassword.text,
                                new_password: studentNewPassword.text);
                            if (error == null) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CustomDialog(
                                    title: 'تعديل كلمة السر',
                                    onPressed: () {
                                      studentCurrentPassword.clear();
                                      studentNewPassword.clear();
                                      studentConfirmPassword.clear();
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop();
                                    }),
                              );
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return warningDialog(
                                      title: 'تنبيه',
                                      message: error.toString(),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      });
                                },
                              );
                            }
                          }
                        }),
                  ],
                )
              ]),
            )),
      ),
    );
  }
}
