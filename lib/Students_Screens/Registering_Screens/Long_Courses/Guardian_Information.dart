import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Student_Certification.dart';

class GuardianInformation extends StatefulWidget {
  const GuardianInformation({super.key, required this.specialtyIDs});
  static String id = "GuardianInformation";
  final List<int> specialtyIDs;

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
                                  return null;
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
                                  return null;
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
                                keyboardType: TextInputType.number,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'رقم الجوال مطلوب';
                                  } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                      .hasMatch(text)) {
                                    return 'الرجاء التأكد من رقم الجوال';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'رقم الأم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentMotherPhoneNumberController,
                                keyboardType: TextInputType.number,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'رقم الجوال مطلوب';
                                  } else if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                      .hasMatch(text)) {
                                    return 'الرجاء التأكد من رقم الجوال';
                                  }
                                  return null;
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
                              builder: (context) => StudentCertification(
                                  specialtyIDs: widget.specialtyIDs),
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
