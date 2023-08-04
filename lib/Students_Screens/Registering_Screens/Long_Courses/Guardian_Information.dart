import 'package:flutter/material.dart';

import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Student_Certification.dart';

class GuardianInformation extends StatefulWidget {
  const GuardianInformation({super.key});
  static String id = "GuardianInformation0";

  @override
  State<GuardianInformation> createState() => _GuardianInformationState();
}

class _GuardianInformationState extends State<GuardianInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              height: hight - 92,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      labelStyle(text: 'معلومات ولي الأمر'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'اسم ولي الأمر'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: guardianNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'عمل ولي الأمر'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: guardianWorkController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'رقم ولي الأمر'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: guardianPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'رقم الجوال مطلوب';
                                  } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                      .hasMatch(text)) {
                                    return 'الرجاء التأكد من رقم الجوال';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'اسم الأم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: motherPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'رقم الهاتف'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: telephoneController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (!RegExp(r'^(\+?963|0)?11\d{7}$')
                                      .hasMatch(text)) {
                                    return 'الرجاء التأكد من رقم الهاتف';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'رقم الطالب'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'رقم الجوال مطلوب';
                                  } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                      .hasMatch(text)) {
                                    return 'الرجاء التأكد من رقم الجوال';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                            //if (formState.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const StudentCertification(),
                            ));
                            //}
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
