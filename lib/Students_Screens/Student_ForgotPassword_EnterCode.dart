import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import 'Student_ForgotPassword_EnterPassword.dart';

class StudentForgotPasswordEnterCode extends StatefulWidget {
  const StudentForgotPasswordEnterCode({super.key});

  @override
  State<StudentForgotPasswordEnterCode> createState() =>
      _StudentForgotPasswordEnterCodeState();
}

class _StudentForgotPasswordEnterCodeState
    extends State<StudentForgotPasswordEnterCode> {
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
              titleText(text: 'أدخل الكود الذي تم إرساله إليك'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                    onChanged: (data) {},
                    //suffixText: '+963',
                    hint: 'أدخل الكود',
                    controller: browserCodeController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'الكود مطلوب';
                      } else if (text.length < 6 && text.length > 6) {
                        return 'الكود يجب أن يكون 6 أرقام';
                      }
                    },
                    labelText: 'الكود',
                    obscure: false,
                    prefix: Icons.numbers,
                    keyboardType: TextInputType.number,
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
                              const StudentForgotPasswordEnterPassword(),
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
