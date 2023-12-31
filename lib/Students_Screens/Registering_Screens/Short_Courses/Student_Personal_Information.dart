import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/DropDownSearch.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Student_Other_Information.dart';

class StudentPersonalInformation extends StatefulWidget {
  const StudentPersonalInformation({super.key});
  static String id = '/StudentPersonalInformation';

  @override
  State<StudentPersonalInformation> createState() =>
      _StudentPersonalInformationState();
}

class _StudentPersonalInformationState
    extends State<StudentPersonalInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DateTime? dateTime;
  late int courseId = ModalRoute.of(context)!.settings.arguments as int;
  int nationalitySelectedIndexVariable = 0;

  String natioality = '';
  var studentCourseNationalityController = TextEditingController();

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
                                    studentGenderVariable = data!;
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                    return null;
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
                                    studentSituationVariable = data!;
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                    return null;
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
                    child: Column(
                      children: [
                        titleText(text: 'العنوان الحالي'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          controller: studentCourseCurrentLocationController,
                          keyboardType: TextInputType.streetAddress,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            } else if (text.length < 3) {
                              return 'الحقل يجب أن يكون 3 أحرف أو أكثر';
                            }
                            return null;
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
                              controller: studentCourseBirthDateController,
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
                                        initialDate: DateTime(1988),
                                        firstDate: DateTime(1988),
                                        lastDate: DateTime(2007),
                                        keyboardType: TextInputType.datetime);
                                    studentCourseBirthDateController.text =
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
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: nationalitySelectedIndexVariable == 2
                          ? Column(
                              children: [
                                Row(
                                  children: [labelFont(text: 'الجنسية')],
                                ),
                                RadioListTile(
                                    value: 1,
                                    groupValue:
                                        nationalitySelectedIndexVariable,
                                    activeColor: PrimaryColor,
                                    title: const Text('فلسطيني مُسجل'),
                                    onChanged: (index) {
                                      setState(() {
                                        nationalitySelectedIndexVariable =
                                            index!;
                                        studentNationalityVariable =
                                            'فلسطيني مُسجل';
                                      });
                                      print(nationalitySelectedIndexVariable);
                                    }),
                                RadioListTile(
                                    value: 2,
                                    groupValue:
                                        nationalitySelectedIndexVariable,
                                    activeColor: PrimaryColor,
                                    title: const Text('أخرى'),
                                    onChanged: (index) {
                                      setState(() {
                                        nationalitySelectedIndexVariable =
                                            index!;
                                        this.natioality =
                                            studentCourseNationalityController
                                                .text;
                                      });
                                      print(nationalitySelectedIndexVariable);
                                    }),
                                registrationInfoTextField(
                                  controller:
                                      studentCourseNationalityController,
                                  keyboardType: TextInputType.name,
                                  radius: 20,
                                  onChanged: (data) {
                                    studentNationalityVariable = '';
                                    setState(() {});
                                  },
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    } else if (text.length < 4) {
                                      return 'الحقل يجب أن يكون 4 أحرف أو أكثر';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [labelFont(text: 'الجنسية')],
                                ),
                                RadioListTile(
                                    value: 1,
                                    groupValue:
                                        nationalitySelectedIndexVariable,
                                    activeColor: PrimaryColor,
                                    title: const Text('فلسطيني مُسجل'),
                                    onChanged: (index) {
                                      setState(() {
                                        nationalitySelectedIndexVariable =
                                            index!;
                                        natioality = 'فلسطيني مُسجل';
                                      });
                                    }),
                                RadioListTile(
                                    value: 2,
                                    groupValue:
                                        nationalitySelectedIndexVariable,
                                    activeColor: PrimaryColor,
                                    title: const Text('أُخرى'),
                                    onChanged: (index) {
                                      setState(() {
                                        nationalitySelectedIndexVariable =
                                            index!;
                                        natioality =
                                            studentCourseNationalityController
                                                .text;
                                      });
                                    }),
                              ],
                            )),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => StudentOtherInformation(
                                      nationality: natioality,
                                      courseId: courseId)),
                            );
                            print(courseId);
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
          )),
    );
  }
}
