import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Students_Screens/Student_Start_Page.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Components/Buttons.dart';
import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';
import '../Student_ForgotPassword_EnterEmail.dart';
import 'Student_SignUp_Screen.dart';

class StudentSignInScreen extends StatefulWidget {
  const StudentSignInScreen({super.key});

  static String id = '/StudentSignInScreen';

  @override
  State<StudentSignInScreen> createState() => _StudentSignInScreenState();
}

class _StudentSignInScreenState extends State<StudentSignInScreen> {
  bool secure = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل الإيميل',
                    controller: studentSignInEmailController,
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
                const SizedBox(
                  height: 30,
                ),
                customTextField(
                    onChanged: (data) {},
                    hint: 'أدخل كلمة المرور',
                    controller: studentSignInPasswordController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else if (text.length < 8) {
                        return 'كلمة المرور يجب أن يكون على الأقل 8 أحرف';
                      }
                      return null;
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
                  height: 15,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const StudentForgotPasswordEnterEmail(),
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
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        isLoading = true;
                        final error = await AuthServices.postLogin(
                            email: studentSignInEmailController.text.toString(),
                            password:
                                studentSignInPasswordController.text.toString(),
                            role: 'student');
                        isLoading = false;
                        if (error == null) {
                          studentSignInEmailController.clear();
                          studentSignInPasswordController.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              StudentStartPage.id, (route) => false);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return warningDialog(
                                  title: 'تنبيه',
                                  message: error.toString(),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  });
                            },
                          );
                        }
                      }
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
                          StudentSignUpScreen.id,
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
      ),
    );
  }
}
