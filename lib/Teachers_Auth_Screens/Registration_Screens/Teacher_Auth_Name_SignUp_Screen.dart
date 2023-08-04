import 'package:flutter/material.dart';
import '../../Components/Buttons.dart';
import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';
import 'Teacher_Auth_SignUp_Screen.dart';

class TeacherAuthNameSignUpPage extends StatefulWidget {
  const TeacherAuthNameSignUpPage({super.key});
  static String id = 'TeacherAuthNameSignUpPage';

  @override
  State<TeacherAuthNameSignUpPage> createState() =>
      _TeacherAuthNameSignUpPageState();
}

class _TeacherAuthNameSignUpPageState extends State<TeacherAuthNameSignUpPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                  hint: 'أدخل الإسم باللغة العربية',
                  controller: browserSinUpFirstNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الإسم مطلوب';
                    } else if (text.length < 3) {
                      return 'الإسم يجب أن يكون على الأقل 3 أحرف';
                    }
                  },
                  labelText: 'الإسم باللغة العربية',
                  obscure: false,
                  prefix: Icons.person,
                  keyboardType: TextInputType.name,
                  radius: 20,
                  padding: 15),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل النسبة باللغة العربية',
                  controller: browserSinUpLastNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الإسم مطلوب';
                    } else if (text.length < 3) {
                      return 'النسبة يجب أن تكون على الأقل 3 أحرف';
                    }
                  },
                  labelText: 'النسبة باللغة العربية',
                  obscure: false,
                  prefix: Icons.person,
                  keyboardType: TextInputType.name,
                  radius: 20,
                  padding: 15),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل الإسم باللغة الإنكليزية',
                  controller: browserSinUpEnglishFirstNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الإسم مطلوب';
                    } else if (text.length < 3) {
                      return 'الإسم يجب أن يكون على الأقل 3 أحرف';
                    }
                  },
                  labelText: 'الإسم باللغة الإنكليزية',
                  obscure: false,
                  prefix: Icons.person,
                  keyboardType: TextInputType.name,
                  radius: 20,
                  padding: 15),
              customTextField(
                  onChanged: (data) {},
                  hint: 'أدخل النسبة باللغة الإنكليزية',
                  controller: browserSinUpEnglishLastNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الإسم مطلوب';
                    } else if (text.length < 3) {
                      return 'النسبة يجب أن تكون على الأقل 3 أحرف';
                    }
                  },
                  labelText: 'النسبة باللغة الإنكليزية',
                  obscure: false,
                  prefix: Icons.person,
                  keyboardType: TextInputType.name,
                  radius: 20,
                  padding: 15),
              const SizedBox(
                height: 15,
              ),
              customButton(
                  onTap: () {
                    if (formState.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TeacherAuthSignUpScreen(),
                      ));
                    }
                  },
                  backgroundColor: PrimaryColor,
                  fontSize: 24,
                  text: 'التالي'),
            ]),
          ),
        ),
      ),
    );
  }
}
