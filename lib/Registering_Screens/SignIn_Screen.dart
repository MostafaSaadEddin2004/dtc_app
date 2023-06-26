import 'package:dtc_app/Registering_Screens/SignUp_Screen.dart';
import 'package:dtc_app/Students_Screens/Student_Home_Page.dart';
import 'package:flutter/material.dart';

import '../Components/Buttons.dart';
import '../Components/TextField.dart';
import '../Constents/Colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String id = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool secure = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                height: 45,
              ),
              Container(
                child: customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل إسم المستخدم',
                    controller: usernameController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'إسم المستخدم مطلوب';
                      } else if (text.length < 3) {
                        return 'إسم المستخدم يجب أن يكون على الأقل 3 أحرف';
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
                    controller: passwordController,
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
                      onPressed: () {},
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
                        SignUpScreen.id,
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
