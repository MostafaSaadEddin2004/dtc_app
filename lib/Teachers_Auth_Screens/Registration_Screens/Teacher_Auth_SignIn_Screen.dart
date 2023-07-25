import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Students_Screens/Student_Home_Page.dart';
import 'package:flutter/material.dart';

import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';
import '../Teacher_Auth_ForgotPassword_EnterEmail.dart';
import 'Teacher_Auth_SignUp_Screen.dart';

class TeacherAuthSignInScreen extends StatefulWidget {
  const TeacherAuthSignInScreen({super.key});

  static String id = 'TeacherAuthSignInScreen';

  @override
  State<TeacherAuthSignInScreen> createState() =>
      _TeacherAuthSignInScreenState();
}

class _TeacherAuthSignInScreenState extends State<TeacherAuthSignInScreen> {
  bool secure = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 90, top: 80, right: 90, bottom: 20),
                child: Image.asset('assets/images/DTC_LOGO.png'),
              ),
              const Text(
                'مرحباً بكم!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل الإيميل',
                    controller: teacherAuthSignInUsernameController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'الإيميل مطلوب';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                          .hasMatch(text)) {
                        return 'يرجى التأكد من إدخال @gmail.com';
                      }
                    },
                    labelText: 'إسم المستخدم',
                    obscure: false,
                    prefix: Icons.person,
                    keyboardType: TextInputType.emailAddress,
                    radius: 20,
                    padding: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل كلمة المرور',
                    controller: teacherAuthSignInPasswordController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else if (text.length < 8) {
                        return 'كلمة المرور يجب أن يكون على الأقل 8 أحرف';
                      }
                    },
                    labelText: 'كلمة المرور',
                    obscure: !secure,
                    prefix: Icons.lock,
                    suffix: IconButton(
                      icon: Icon(
                        secure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          secure = !secure;
                        });
                      },
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    radius: 20,
                    padding: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const TeacherAuthForgotPasswordEnterEmail(),
                        ));
                      },
                      child: const Text(
                        "هل نسيت كلمة المرور ؟",
                        style: TextStyle(
                          color: RedColor,
                          fontSize: 16,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              customButton(
                  onTap: () {
                    if (formState.currentState!.validate()) {}
                  },
                  backgroundColor: PrimaryColor,
                  fontSize: 24,
                  text: 'تسجيل الدخول'),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    thickness: 1,
                    color: BlackColor,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      color: WhiteColor,
                      child: const Text(
                        'أو',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ليس لديك حساب ؟",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        TeacherAuthSignUpScreen.id,
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      'التسجيل الآن',
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
