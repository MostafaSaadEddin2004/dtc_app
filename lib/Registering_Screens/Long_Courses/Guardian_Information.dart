import 'package:flutter/material.dart';

import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Components/Label.dart';
import '../../Components/TextField.dart';
import '../../Constents/Colors.dart';
import '../../Constents/TextStyle.dart';
import 'Student_Certification.dart';

class GuardianInformation extends StatefulWidget {
  const GuardianInformation({super.key});
  static String id = "GuardianInformation0";

  @override
  State<GuardianInformation> createState() => _GuardianInformationState();
}

class _GuardianInformationState extends State<GuardianInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianWorkController = TextEditingController();
  TextEditingController guardianPhoneNumberController = TextEditingController();
  TextEditingController motherPhoneNumberController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController studentPhoneNumberController = TextEditingController();

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
                                onChanged: (data) {},
                                controller: guardianNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                                onChanged: (data) {},
                                controller: guardianWorkController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                                onChanged: (data) {},
                                controller: guardianPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                                onChanged: (data) {},
                                controller: motherPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                                onChanged: (data) {},
                                controller: telephoneController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                                onChanged: (data) {},
                                controller: studentPhoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const StudentCertification(),
                            ));
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
