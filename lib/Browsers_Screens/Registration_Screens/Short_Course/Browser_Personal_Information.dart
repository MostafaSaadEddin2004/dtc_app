import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/DropDownSearch.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Browser_Other_Information.dart';

class BrowserPersonalInformation extends StatefulWidget {
  const BrowserPersonalInformation({super.key});
  static String id = 'BrowserPersonalInformation';

  @override
  State<BrowserPersonalInformation> createState() =>
      _BrowserPersonalInformationState();
}

class _BrowserPersonalInformationState
    extends State<BrowserPersonalInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DateTime? dateTime;
  late int courseId = ModalRoute.of(context)!.settings.arguments as int;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
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
                      labelStyle(text: 'المعلومات شخصية'),
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
                              titleText(text: 'الجنس'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['ذكر', 'أنثى'],
                                  onChange: (data) {
                                    browserGenderVariable = data!;
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                  })
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الحالة الإجتماعية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['متزوج', 'مخطوب', 'أعزب'],
                                  onChange: (data) {
                                    browserSituationVariable = data!;
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                  })
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
                    child: browserNationalityVariable == 'فلسطيني مُسجل' ||
                            browserNationalityVariable == ''
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
                                      browserNationalityVariable = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
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
                                      browserNationalityVariable = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: browserCourseNationalityController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 4) {
                                    return 'الحقل يجب أن يكون 4 أحرف أو أكثر';
                                  }
                                },
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
                        titleText(text: 'العنوان الحالي'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          controller: browserCourseCurrentLocationController,
                          keyboardType: TextInputType.streetAddress,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            } else if (text.length < 3) {
                              return 'الحقل يجب أن يكون 3 أحرف أو أكثر';
                            }
                          },
                        )
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
                          child: TextFormField(
                              onChanged: (data) {},
                              controller: browserCourseBirthDateController,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
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
                                    browserCourseBirthDateController.text =
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
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nextButton(
                          text: 'التالي',
                          onTap: () {
                            if (formState.currentState!.validate()) {
                              Navigator.of(context).pushNamed(
                                  BrowserOtherInformation.id,
                                  arguments: courseId);
                            }
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
