import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:flutter/material.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import 'Student_ForgotPassword_EnterCode.dart';

class StudentForgotPasswordEnterEmail extends StatefulWidget {
  const StudentForgotPasswordEnterEmail({super.key});

  @override
  State<StudentForgotPasswordEnterEmail> createState() =>
      _StudentForgotPasswordEnterEmailState();
}

class _StudentForgotPasswordEnterEmailState
    extends State<StudentForgotPasswordEnterEmail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تغيير كلمة السر'),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(children: [
              titleText(text: 'أدخل إيميل لإستلام كود لتغيير كلمة المرور'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل الإيميل',
                    controller: studentForgotPasswordEmailController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'الإيميل مطلوب';
                      }
                      else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                          .hasMatch(text)) {
                        return 'يرجى التأكد من إدخال @gmail.com';
                      }return null;
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
                        //if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const StudentForgotPasswordEnterCode(),
                        ));
                        //}
                      }),
                ],
              )
            ]),
          )),
    );
  }
}
