import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/TextField.dart';
import '../Constents/Controller.dart';
import '../Constents/TextStyle.dart';
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
                controller: browserEmailController,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'الإيميل مطلوب';
                  }
                  if (!RegExp(r'^\w+@gmail.com$').hasMatch(text)) {
                    return 'يرجى التأكد من إدخال @gmail.com';
                  }
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
