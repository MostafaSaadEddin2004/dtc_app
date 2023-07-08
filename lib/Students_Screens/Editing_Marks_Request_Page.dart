import 'package:flutter/material.dart';

import '../Components/Buttons.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constents/Colors.dart';
import '../Constents/TextStyle.dart';

class EditingMarksRequestPage extends StatefulWidget {
  const EditingMarksRequestPage({super.key});
  static String id = 'EditingMarksRequestPage';

  @override
  State<EditingMarksRequestPage> createState() =>
      _EditingMarksRequestPageState();
}

class _EditingMarksRequestPageState extends State<EditingMarksRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController markEditingRequestTextController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('طلب تعديل العلامات'),
      ),
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Container(
            height: height - 92,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                              controller: fullNameController,
                              keyboardType: TextInputType.name,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                } else if (text.length < 3) {
                                  return 'الحقل يجب أن يكون 5 أحرف او أكثر';
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
                            titleText(text: 'العلامة المكتسبة'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              controller: markController,
                              keyboardType: TextInputType.name,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                } else if (text.length < 4) {
                                  return 'الحقل يجب أن يكون 4 أرقام';
                                } else if (text.length > 4) {
                                  return 'الحقل يجب أن يكون 4 أرقام';
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
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Column(
                    children: [
                      titleText(text: 'نص طلب تعديل العلامات'),
                      const SizedBox(
                        height: 10,
                      ),
                      registrationInfoTextField(
                        controller: markEditingRequestTextController,
                        keyboardType: TextInputType.name,
                        radius: 20,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'الحقل مطلوب';
                          }
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: [
                      Expanded(
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
                            ], onChange: (data) {}, validator: (data) {})
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            titleText(text: 'الفرع'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationDropDownSearch(hint: '',

                                items: [],
                                onChange: (data) {},
                                validator: (data) {})
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            titleText(text: 'إسم المدرس'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationDropDownSearch(hint: '',
                                items: [],
                                onChange: (data) {},
                                validator: (data) {})
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            titleText(text: 'إسم المادة'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationDropDownSearch(
                              hint: '',
                                items: [],
                                onChange: (data) {},
                                validator: (data) {})
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
                    nextButton(text: 'إنهاء', onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
