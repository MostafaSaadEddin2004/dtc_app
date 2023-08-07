import 'package:flutter/material.dart';

import '../Components/Buttons.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class EditingMarksRequestPage extends StatefulWidget {
  const EditingMarksRequestPage({super.key});
  static String id = 'EditingMarksRequestPage';

  @override
  State<EditingMarksRequestPage> createState() =>
      _EditingMarksRequestPageState();
}

class _EditingMarksRequestPageState extends State<EditingMarksRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

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
                            titleText(text: 'إسم المدرس'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationDropDownSearch(
                                hint: '',
                                items: [],
                                onChange: (data) {
                                  teacherName = data!;
                                },
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
                                onChange: (data) {
                                  subjectName = data!;
                                },
                                validator: (data) {})
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
                      titleText(text: 'العلامة المكتسبة'),
                      const SizedBox(
                        height: 10,
                      ),
                      registrationInfoTextField(
                        controller: studentEMRGainedMarkController,
                        keyboardType: TextInputType.number,
                        radius: 20,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (int.parse(text) < 0 ||
                              int.parse(text) > 2700) {
                            return 'العلامة يجب أن تكون بين 0 - 2700';
                          }
                        },
                      )
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
                      TextFormField(
                          onChanged: (data) {},
                          controller: markEditingRequestTextController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            }
                          },
                          keyboardType: TextInputType.text,
                          enabled: true,
                          cursorColor: GreyColor,
                          decoration: InputDecoration(
                            hintText: 'أكتب هنا...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 50),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: GreyColor),
                            ),
                          )),
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
