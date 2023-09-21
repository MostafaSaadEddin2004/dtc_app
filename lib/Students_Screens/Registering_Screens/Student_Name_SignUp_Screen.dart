import 'package:dtc_app/Students_Screens/Registering_Screens/student_profile_image.dart';
import 'package:flutter/material.dart';
import '../../Components/Buttons.dart';
import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';

class StudentNameSignUpPage extends StatefulWidget {
  const StudentNameSignUpPage({super.key});
  static String id = '/StudentNameSignUpPage';

  @override
  State<StudentNameSignUpPage> createState() => _StudentNameSignUpPageState();
}

class _StudentNameSignUpPageState extends State<StudentNameSignUpPage> {
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
                  controller: studentSinUpFirstNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الحقل مطلوب';
                    } else if (text.length < 3) {
                      return 'الإسم يجب أن يكون على الأقل 3 أحرف';
                    } else if (!RegExp(r'^[\u0600-\u06FF\s]+$')
                        .hasMatch(text)) {
                      return 'تأكد من إدخال الإسم باللغة العربية';
                    }
                    return null;
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
                  controller: studentSinUpLastNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الحقل مطلوب';
                    } else if (text.length < 3) {
                      return 'النسبة يجب أن تكون على الأقل 3 أحرف';
                    } else if (!RegExp(r'^[\u0600-\u06FF\s]+$')
                        .hasMatch(text)) {
                      return 'تأكد من إدخال النسبة باللغة العربية';
                    }
                    return null;
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
                  controller: studentSinUpEnglishFirstNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الحقل مطلوب';
                    } else if (text.length < 3) {
                      return 'الإسم يجب أن يكون على الأقل 3 أحرف';
                    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(text)) {
                      return 'تأكد من إدخال الإسم باللغة الإنكليزية';
                    }
                    return null;
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
                  controller: studentSinUpEnglishLastNameController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'الحقل مطلوب';
                    } else if (text.length < 3) {
                      return 'النسبة يجب أن تكون على الأقل 3 أحرف';
                    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(text)) {
                      return 'تأكد من إدخال النسبة باللغة الإنكليزية';
                    }
                    return null;
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
                        builder: (context) => const StudentProfileImage(),
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
