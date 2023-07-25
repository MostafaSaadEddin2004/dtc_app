import 'package:dtc_app/Components/TextField.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Constants/Controller.dart';
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

  bool checkBoxValue = false;

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
                  hint: 'أدخل إسم الستخدم',
                  controller: teacherSignUpUsernameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'إسم المستخدم مطلوب';
                    }
                    if (text.length < 3) {
                      return 'إسم المسخدم يجب أن يكون 3 أحرف على الأقل';
                    }
                  },
                  labelText: 'إسم المسنخدم',
                  obscure: false,
                  prefix: Icons.person,
                  keyboardType: TextInputType.name,
                  radius: 20,
                  padding: 15),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل الإيميل',
                  controller: teacherSignUpEmailController,
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
              const SizedBox(
                height: 5,
              ),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل كلمة المرور',
                  controller: teacherSignUpPasswordController,
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
                  //suffixText: '+963',
                  hint: 'أدخل رقم الجوال',
                  controller: teacherSignUpPhoneController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'رقم الجوال مطلوب';
                    } else if (!RegExp(r'^(\+?963|0)?9\d{8}$').hasMatch(text)) {
                      return 'الرجاء التأكد من رقم الجوال';
                    }
                  },
                  labelText: 'رقم الجوال',
                  obscure: false,
                  prefix: Icons.call,
                  keyboardType: TextInputType.number,
                  radius: 20,
                  padding: 15),
              const SizedBox(
                height: 15,
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
