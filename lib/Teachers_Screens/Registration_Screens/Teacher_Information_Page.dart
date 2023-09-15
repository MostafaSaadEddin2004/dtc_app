import 'package:flutter/material.dart';
import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Components/DropDownSearch.dart';
import '../../Components/Label.dart';
import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';
import '../../Constants/TextStyle.dart';
import '../Teacher_Start_Page.dart';

class TeacherInformationPage extends StatefulWidget {
  const TeacherInformationPage({super.key});
  static String id = 'TeacherInformationPage';

  @override
  State<TeacherInformationPage> createState() => _TeacherInformationPageState();
}

class _TeacherInformationPageState extends State<TeacherInformationPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'معلومات الأستاذ المسؤول الشخصية'),
        body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
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
                              titleText(text: 'الشهادة'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: teacherCertificationController,
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
                              titleText(text: 'الإختصاص'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: teacherSpecialtyController,
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
                              controller: teacherBirthDateController,
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
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2024),
                                        keyboardType: TextInputType.datetime);
                                    teacherBirthDateController.text =
                                        '${dateTime?.day} / ${dateTime?.month} / ${dateTime?.year}';
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
                                controller: teacherCurrentLocationController,
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
                                controller: teacherPermanentLocationController,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: teacherNationalityVariable == 'فلسطيني مُسجل' ||
                            teacherNationalityVariable == ''
                        ? Column(
                            children: [
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['فلسطيني مُسجل', 'أخرى...'],
                                  onChange: (data) {
                                    setState(() {
                                      teacherNationalityVariable = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
                                    return null;
                                  }),
                            ],
                          )
                        : Column(
                            children: [
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['فلسطيني مُسجل', 'أخرى...'],
                                  onChange: (data) {
                                    setState(() {
                                      teacherNationalityVariable = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: teacherAuthNationalityController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 10) {
                                    return 'الحقل يجب أن يكون 4 أحرف أو أكثر';
                                  } else if (text.length > 10) {
                                    return 'الحقل يجب أن يكون 4 أحرف او أكثر';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        titleText(text: 'القسم'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationDropDownSearch(
                            hint: '',
                            items: [
                              'تكنولوجيا المعلومات',
                              'الطبي',
                              'الهندسي',
                              'التجاري',
                              'الميكانيكي'
                            ],
                            onChange: (data) {
                              setState(() {
                                teacherDepartmentVariable = data!;
                              });
                            },
                            validator: (data) {
                              if (data!.isEmpty) {
                                return 'االحقل مطلوب';
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nextButton(
                        text: 'إنهاء',
                        onTap: () {
                          if (formState.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherStartPage()));
                          }
                        },
                      ),
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