import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:flutter/material.dart';

import '../../../Components/Buttons.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';
import 'Student_Required_Documents.dart';

class StudentOtherInformation extends StatefulWidget {
  const StudentOtherInformation({super.key});
  static String id = 'StudentOtherInformation';

  @override
  State<StudentOtherInformation> createState() =>
      _StudentOtherInformationState();
}

class _StudentOtherInformationState extends State<StudentOtherInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  int educationSelectedIndex = 1;
  int workSelectedIndex = 1;
  int timeSelectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(left: 28),
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
                    title: const Text('طالب خارج المعهد'),
                    onChanged: (index) {
                      setState(() {
                        educationSelectedIndex = index!;
                      });
                    }),
                const SizedBox(
                  height: 15,
                ),
                educationSelectedIndex == 3
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            labelFont(text: 'مكان الدراسة'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              controller: studentEducationPlaceController,
                              keyboardType: TextInputType.name,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                } else if (text.length < 3) {
                                  return 'الحقل يجب أن يكون 8 أحرف أ, أكثر ';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
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
                  padding: const EdgeInsets.only(left: 28),
                  child: labelFont(text: 'وقت الدورة'),
                ),
                RadioListTile(
                    value: 1,
                    groupValue: timeSelectedIndex,
                    activeColor: PrimaryColor,
                    title: const Text('صباحي'),
                    onChanged: (index) {
                      setState(() {
                        timeSelectedIndex = index!;
                      });
                    }),
                RadioListTile(
                    value: 2,
                    groupValue: timeSelectedIndex,
                    activeColor: PrimaryColor,
                    title: const Text('مسائي'),
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
                        text: 'التالي',
                        onTap: () {
                          //if (formState.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const StudentRequiredDocuments(),
                          ));
                          //}
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
          )),
    );
  }
}
