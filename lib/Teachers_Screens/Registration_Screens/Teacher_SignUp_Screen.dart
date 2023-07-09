import 'package:dtc_app/Components/TextField.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';
import '../../Components/Buttons.dart';
import '../Teacher_Information_Page.dart';
import 'Teacher_SignIn_Screen.dart';

class TeacherSignUpScreen extends StatefulWidget {
  const TeacherSignUpScreen({super.key});

  static String id = 'TeacherSignUpScreen';

  @override
  State<TeacherSignUpScreen> createState() => _TeacherSignUpScreenState();
}

class _TeacherSignUpScreenState extends State<TeacherSignUpScreen> {
  bool secure = false;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool CheckBoxValue = false;

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
                child: Image.asset(
                  'assets/images/DTC_LOGO.png',
                ),
              ),
              const Text(
                'مرحباً بكم!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              customTextField(
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
              const SizedBox(
                height: 5,
              ),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل كلمة المرور',
                  controller: passwordController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'كلمة المرور مطلوبة';
                    } else if (text.length < 8) {
                      return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
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
              const SizedBox(
                height: 5,
              ),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل رقم الهاتف',
                  controller: phoneController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'رقم الهاتف مطلوب';
                    } else if (text.length < 10) {
                      return 'رقم الهاتف يجب أن يكون على الأقل 10 أرقام';
                    } else if (text.length > 10) {
                      return 'رقم الهاتف يجب أن يكون 10 أرقام';
                    }
                  },
                  labelText: 'رقم الهاتف',
                  obscure: false,
                  prefix: Icons.call,
                  keyboardType: TextInputType.number,
                  radius: 20,
                  padding: 15),
              const SizedBox(
                height: 49,
              ),
              customButton(
                  onTap: () {
                    if (formState.currentState!.validate()) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        TeacherInformationPage.id,
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                  backgroundColor: PrimaryColor,
                  fontSize: 24,
                  text: 'التسجيل الآن'),
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
                    'هل لديك حساب؟',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        TeacherSignInScreen.id,
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
