import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';

import '../../Components/CustomAppBar.dart';
import '../../Components/Label.dart';
import '../../Components/TextField.dart';
import '../../Constents/TextStyle.dart';
import 'Guardian_Information.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  static String id = "PersonalInformation";

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController englishFullNameController = TextEditingController();
  TextEditingController soliderController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController permanentController = TextEditingController();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              height: height - 92,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      labelStyle(text: 'المعلومات الشخصية'),
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
                              titleText(text: 'الإسم الكامل'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: fullNameController,
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
                              titleText(text: 'إسم الأب'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: fatherNameController,
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
                              titleText(text: 'إسم الأم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: motherNameController,
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
                              titleText(text: 'مكان الولادة'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: birthDateController,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'تاريخ الولادة'),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // decoration: BoxDecoration(
                          //   color: WhiteColor,
                          //   borderRadius: BorderRadius.circular(20),
                          //   boxShadow: const [
                          //     BoxShadow(
                          //       color: GreyColor,
                          //       blurRadius: 2,
                          //       offset: Offset(2, 2), // Shadow position
                          //     ),
                          //   ],
                          // ),
                          child: TextFormField(
                              onChanged: (data) {},
                              controller: birthDateController,
                              validator: (text) {},
                              keyboardType: TextInputType.none,
                              enabled: true,
                              cursorColor: GreyColor,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                suffixIconColor: BlackColor,
                                floatingLabelStyle: const TextStyle(
                                  color: BlackColor,
                                ),
                                hintText: 'أنقر على الرمز لإختيار التاريخ',
                                labelStyle: const TextStyle(
                                    color: GreyColor, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_month),
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2024),
                                            keyboardType:
                                                TextInputType.datetime)
                                        .then((value) {
                                      setState(() {
                                        dateTime = value;
                                      });
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: GreyColor),
                                ),
                              )),
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
                              titleText(text: 'شعبة التجنيد'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: soliderController,
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
                              titleText(text: 'الإسم الكامل بالإنكليزية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: englishFullNameController,
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
                              titleText(text: 'العنوان الحالي'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: currentController,
                                keyboardType: TextInputType.streetAddress,
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
                              titleText(text: 'العنوان الدائم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                onChanged: (data) {},
                                controller: permanentController,
                                keyboardType: TextInputType.streetAddress,
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
                                    const GuardianInformation()));
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
