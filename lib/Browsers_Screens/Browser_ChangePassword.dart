import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';

class BrowserChangePasswordEnterPassword extends StatefulWidget {
  const BrowserChangePasswordEnterPassword({super.key});

  @override
  State<BrowserChangePasswordEnterPassword> createState() =>
      _BrowserChangePasswordEnterPasswordState();
}

class _BrowserChangePasswordEnterPasswordState
    extends State<BrowserChangePasswordEnterPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool currentSecure = false;
  bool newSecure = false;
  bool confirmSecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: browserCurrentPassword,
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
                        currentSecure ? Icons.visibility : Icons.visibility_off,
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
                    controller: browserNewPassword,
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
                    controller: browserConfirmPassword,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else if (text.length < 8) {
                        return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                      } else if (browserConfirmPassword.text !=
                          browserNewPassword.text) {
                        return 'كلمة المرور غير متطابقة';
                      }
                      return null;
                    },
                    labelText: 'تأكيد كلمة المرور',
                    obscure: !confirmSecure,
                    prefix: Icons.lock,
                    suffix: IconButton(
                      icon: Icon(
                        confirmSecure ? Icons.visibility : Icons.visibility_off,
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
                      text: 'إنهاء',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final error = await AuthServices.postEditProfile(
                              current_password: browserCurrentPassword.text,
                              new_password: browserNewPassword.text,
                              new_password_confirmation:
                                  browserConfirmPassword.text);
                          if (error == null) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => CustomDialog(
                                  title: 'تعديل كلمة السر',
                                  onPressed: () {
                                    browserCurrentPassword.clear();
                                    browserNewPassword.clear();
                                    browserConfirmPassword.clear();
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
    );
  }
}
