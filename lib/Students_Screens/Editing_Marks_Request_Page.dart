import 'package:dtc_app/Components/Dialogs.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Components/Buttons.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import '../api/services/edit_mark_request_service.dart';

class EditingMarksRequestPage extends StatefulWidget {
  const EditingMarksRequestPage({super.key});
  static String id = 'EditingMarksRequestPage';

  @override
  State<EditingMarksRequestPage> createState() =>
      _EditingMarksRequestPageState();
}

class _EditingMarksRequestPageState extends State<EditingMarksRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                                  items: ['Rana', 'Mai'],
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
                                  items: ['c#', 'python'],
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                                int.parse(text) > 100) {
                              return 'العلامة يجب أن تكون بين 0 - 100';
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'نص طلب تعديل العلامات'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          controller: markEditingRequestTextController,
                          keyboardType: TextInputType.text,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            }
                          },
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
                          text: 'إنهاء',
                          onTap: () {
                            if (formState.currentState!.validate()) {
                              isLoading = true;
                              final editMark =
                                  EditMarkRequestService.postEditMarkRequest(
                                      subject: subjectName,
                                      mark: int.parse(
                                          studentEMRGainedMarkController.text),
                                      reason: markEditingRequestTextController
                                          .text
                                          .toString(),
                                      teacher: teacherName,
                                      user_id: 1);
                              isLoading = false;
                              showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                    title: 'إرسال طلب تعديل العلامة',
                                    onPressed: () {
                                      studentEMRGainedMarkController.clear();
                                      markEditingRequestTextController.clear();
                                      Navigator.of(context)
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
