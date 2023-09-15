import 'package:flutter/material.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';

class BrowserForgotPasswordEnterPassword extends StatefulWidget {
  const BrowserForgotPasswordEnterPassword({super.key});

  @override
  State<BrowserForgotPasswordEnterPassword> createState() =>
      _BrowserForgotPasswordEnterPasswordState();
}

class _BrowserForgotPasswordEnterPasswordState
    extends State<BrowserForgotPasswordEnterPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                    hint: 'أدخل كلمة المرور الجديدة',
                    controller: browserForgotPasswordNewPassword,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else if (text.length < 8) {
                        return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                      }return null;
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
                    controller: browserForgotPasswordConfirmPassword,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else if (text.length < 8) {
                        return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
                      } else if (browserForgotPasswordConfirmPassword.text !=
                          browserForgotPasswordNewPassword.text) {
                        return 'كلمة المرور غير متطابقة';
                      }return null;
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
                      text: 'التالي',
                      onTap: () {
                        //if (formKey.currentState!.validate()) {
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop();
                        //}
                      }),
                ],
              )
            ]),
          )),
    );
  }
}
