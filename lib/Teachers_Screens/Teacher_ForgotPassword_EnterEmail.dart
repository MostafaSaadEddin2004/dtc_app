import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:dtc_app/api/services/forget_password_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import 'Teacher_ForgotPassword_EnterCode.dart';

class TeacherForgotPasswordEnterEmail extends StatefulWidget {
  const TeacherForgotPasswordEnterEmail({super.key});

  @override
  State<TeacherForgotPasswordEnterEmail> createState() =>
      _TeacherForgotPasswordEnterEmailState();
}

class _TeacherForgotPasswordEnterEmailState
    extends State<TeacherForgotPasswordEnterEmail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'تغيير كلمة السر'),
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(children: [
                titleText(text: 'أدخل بريدك الإلكتروني لاستلام رمز التحقق'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customTextField(
                      onChanged: (data) {},
                      hint: 'أدخل الإيميل',
                      controller: teacherForgotPasswordEmailController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'الإيميل مطلوب';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                            .hasMatch(text)) {
                          return 'يرجى التأكد من إدخال @gmail.com';
                        }
                        return null;
                      },
                      labelText: 'الإيميل',
                      obscure: false,
                      prefix: Icons.email,
                      keyboardType: TextInputType.emailAddress,
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
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            ForgetPasswordService.postToken(
                                email:
                                    teacherForgotPasswordEmailController.text,
                                token:
                                    teacherForgotPasswordCodeController.text);
                            isLoading = false;
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const TeacherForgotPasswordEnterCode(),
                            ));
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
