import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:dtc_app/api/services/short_course_registration_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';

class StudentOtherInformation extends StatefulWidget {
  const StudentOtherInformation(
      {super.key, required this.nationality, required this.courseId});
  static String id = '/StudentOtherInformation';

  final String nationality;

  final int courseId;

  @override
  State<StudentOtherInformation> createState() =>
      _StudentOtherInformationState();
}

class _StudentOtherInformationState extends State<StudentOtherInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  int educationSelectedIndex = 1;
  int workSelectedIndex = 1;
  int timeSelectedIndex = 1;
  int nationalitySelectedIndexVariable = 0;
  bool isMale = false;
  bool isMorning = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
        body: Form(
            key: formState,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      labelStyle(text: 'معلومات أخرى'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: labelFont(text: 'الدراسة'),
                  ),
                  RadioListTile(
                      value: 1,
                      groupValue: educationSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('طالب في المعهد'),
                      onChanged: (index) {
                        setState(() {
                          educationSelectedIndex = index!;
                        });
                      }),
                  RadioListTile(
                      value: 2,
                      groupValue: educationSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('طالب متخرج من المعهد'),
                      onChanged: (index) {
                        setState(() {
                          educationSelectedIndex = index!;
                        });
                      }),
                  RadioListTile(
                      value: 3,
                      groupValue: educationSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('طالب جامعي'),
                      onChanged: (index) {
                        setState(() {
                          educationSelectedIndex = index!;
                        });
                      }),
                  RadioListTile(
                      value: 4,
                      groupValue: educationSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('طالب جامعي متخرج'),
                      onChanged: (index) {
                        setState(() {
                          educationSelectedIndex = index!;
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: labelFont(text: 'العمل'),
                  ),
                  RadioListTile(
                      value: 1,
                      groupValue: workSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('إعمال حرة'),
                      onChanged: (index) {
                        setState(() {
                          workSelectedIndex = index!;
                        });
                      }),
                  RadioListTile(
                      value: 2,
                      groupValue: workSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('عمل بدوام جزئي'),
                      onChanged: (index) {
                        setState(() {
                          workSelectedIndex = index!;
                        });
                      }),
                  RadioListTile(
                      value: 3,
                      groupValue: workSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('عمل بدوام كامل'),
                      onChanged: (index) {
                        setState(() {
                          workSelectedIndex = index!;
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: labelFont(text: 'وقت الدورة'),
                  ),
                  RadioListTile(
                      value: 1,
                      groupValue: timeSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('صباحي قبل الساعة الثانية ظهراً'),
                      onChanged: (index) {
                        setState(() {
                          timeSelectedIndex = index!;
                          print(timeSelectedIndex);
                        });
                      }),
                  RadioListTile(
                      value: 2,
                      groupValue: timeSelectedIndex,
                      activeColor: PrimaryColor,
                      title: const Text('مسائي بعد الساعة الثانية ظهراً'),
                      onChanged: (index) {
                        setState(() {
                          timeSelectedIndex = index!;
                          print(timeSelectedIndex);
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nextButton(
                          text: 'إنهاء',
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              formState.currentState!.save();
                              isLoading = true;
                              getNationalityValue(
                                  index: nationalitySelectedIndexVariable,
                                  value: studentNationalityVariable.toString());
                              getGender(
                                  studentGenderVariable: studentGenderVariable,
                                  isMale: isMale);
                              getCourseTime(
                                  timeSelectedIndex: timeSelectedIndex,
                                  isMorning: isMorning);
                              await ShortCourseRegistration
                                  .postShortCourseRegistration(
                                      address:
                                          studentCourseCurrentLocationController
                                              .text,
                                      date_of_birth:
                                          studentCourseBirthDateController.text,
                                      is_male: studentGenderVariable ==
                                              'ذكر'
                                          ? true
                                          : false,
                                      is_morning:
                                          timeSelectedIndex == 1 ? true : false,
                                      nationality: widget.nationality,
                                      social_status: studentSituationVariable,
                                      student_type: getStudentType(
                                          educationSelectedIndex:
                                              educationSelectedIndex),
                                      work_type: getWorkType(
                                          workSelectedIndex: workSelectedIndex),
                                      course_id: widget.courseId);
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CustomDialog(
                                    title: 'تسجيل طلب الإنتساب للدورة',
                                    onPressed: () {
                                      studentCourseCurrentLocationController
                                          .clear();
                                      studentCourseBirthDateController.clear();
                                      studentGenderVariable = '';
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop()
                                        ..pop();
                                    }),
                              );
                            }
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
            )),
      ),
    );
  }
}

String getStudentType({required int educationSelectedIndex}) {
  if (educationSelectedIndex == 1) {
    return 'طالب في المعهد';
  } else if (educationSelectedIndex == 2) {
    return 'طالب متخرج من المعهد';
  } else if (educationSelectedIndex == 3) {
    return 'طالب جامعي';
  } else {
    return 'طالب جامعي متخرج';
  }
}

String getWorkType({required int workSelectedIndex}) {
  if (workSelectedIndex == 1) {
    return 'أعمال حرة';
  } else if (workSelectedIndex == 2) {
    return 'عمل بدوم جزئي';
  } else {
    return 'عمل بدوام كامل';
  }
}

void getGender({required String studentGenderVariable, required bool isMale}) {
  if (studentGenderVariable == 'ذكر') {
    isMale = true;
  } else {
    isMale = false;
  }
}

getCourseTime({required int timeSelectedIndex, required bool isMorning}) {
  if (timeSelectedIndex == 1) {
    isMorning = true;
  } else {
    isMorning = false;
  }
}

void getNationalityValue({required String value, required int index}) {
  if (index == 1) {
    studentNationalityVariable = 'فلسطيني مُسجل';
  } else if (index == 2) {
    studentNationalityVariable = value;
  }
}
