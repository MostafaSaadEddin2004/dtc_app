import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Guardian_Information.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key, required this.specialtyIDs});

  static String id = "PersonalInformation";
  final List<int> specialtyIDs;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
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
                              titleText(text: 'إسم الأم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentMotherNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (text.length < 2) {
                                    return 'الحقل يجب أن يكون حرفين على الأقل';
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
                              titleText(text: 'إسم الأب'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentFatherNameController,
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
                              titleText(text: 'شعبة التجنيد'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentSoliderController,
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
                              titleText(text: 'مكان الولادة'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentBirthPlaceController,
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
                              controller: studentBirthDateController,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
                                return null;
                              },
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
                                  onPressed: () async {
                                    dateTime = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2000),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2007),
                                        keyboardType: TextInputType.datetime);
                                    studentBirthDateController.text =
                                        '${dateTime?.day}-${dateTime?.month}-${dateTime?.year}';
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
                                controller: studentCurrentController,
                                keyboardType: TextInputType.streetAddress,
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
                              titleText(text: 'العنوان الدائم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentPermanentController,
                                keyboardType: TextInputType.streetAddress,
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
                                builder: (context) => GuardianInformation(
                                      specialtyIDs: widget.specialtyIDs,
                                    )));
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
