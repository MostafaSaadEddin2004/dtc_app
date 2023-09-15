import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import '../../../api/services/short_course_registration_service.dart';

class BrowserOtherInformation extends StatefulWidget {
  const BrowserOtherInformation({super.key});
  static String id = 'BrowserOtherInformation';

  @override
  State<BrowserOtherInformation> createState() =>
      _BrowserOtherInformationState();
}

class _BrowserOtherInformationState extends State<BrowserOtherInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  int educationSelectedIndex = 1;
  int workSelectedIndex = 1;
  int timeSelectedIndex = 1;
  bool isLoading = false;
  late int courseId = ModalRoute.of(context)!.settings.arguments as int;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
        body: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height,
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
                                print('Tapped');
                                isLoading = true;
                                final shortCourseRegistration = await ShortCourseRegistration
                                    .postShortCourseRegistration(
                                        address:
                                            browserCourseCurrentLocationController
                                                .text,
                                        date_of_birth:
                                            browserCourseBirthDateController
                                                .text,
                                        is_male: browserGenderVariable == 'ذكر'
                                            ? true
                                            : false,
                                        is_morning: timeSelectedIndex == 1
                                            ? true
                                            : false,
                                        nationality: browserNationalityVariable ==
                                                ''
                                            ? browserNationalityVariable
                                            : browserCourseNationalityController
                                                .text,
                                        social_status: browserSituationVariable,
                                        student_type: GetStudentType(
                                            educationSelectedIndex:
                                                educationSelectedIndex),
                                        work_type: GetWorkType(
                                            workSelectedIndex:
                                                workSelectedIndex),
                                        course_id: courseId);
                                print(shortCourseRegistration);
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                      title: 'الإنتساب للدورة',
                                      onPressed: () {
                                        browserCourseCurrentLocationController
                                            .clear();
                                        browserCourseBirthDateController
                                            .clear();
                                        browserGenderVariable = '';
                                        browserNationalityVariable = '';
                                        browserCourseNationalityController
                                            .clear();
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
                ),
              ),
            )),
      ),
    );
  }
}

String GetStudentType({required int educationSelectedIndex}) {
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

String GetWorkType({required int workSelectedIndex}) {
  if (workSelectedIndex == 1) {
    return 'أعمال حرة';
  } else if (workSelectedIndex == 2) {
    return 'عمل بدوم جزئي';
  } else {
    return 'عمل بدوام كامل';
  }
}
