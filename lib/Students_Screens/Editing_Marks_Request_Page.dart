import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Components/showDialogList.dart';
import 'package:dtc_app/blocs/select_teacher/select_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import '../api/services/edit_mark_request_service.dart';

class EditingMarksRequestPage extends StatefulWidget {
  const EditingMarksRequestPage({super.key});
  static String id = '/EditingMarksRequestPage';

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
    List subjectData = ['python', 'c#'];
    return BlocProvider(
      create: (context) => SelectTeacherCubit()..fetchData(),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Builder(builder: (context) {
          final state =
              BlocProvider.of<SelectTeacherCubit>(context, listen: true).state;
          if (state is! SelectTeacherFetched) {
            return Loading();
          }
          final teachers = state.teachers;
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
                                  ShowDialogList(
                                    cubit: BlocProvider.of<SelectTeacherCubit>(
                                        context),
                                    value: teacherName == ''
                                        ? 'إختر...'
                                        : teacherName,
                                    child: ListView.builder(
                                      itemCount: teachers.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            teacherName = teachers[index].name;
                                            teacherId = teachers[index].id;
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(teachers[index].name)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  titleText(text: 'إسم المادة'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ShowDialogList(
                                    value: subjectName == ''
                                        ? 'إختر...'
                                        : subjectName,
                                    child: ListView.builder(
                                      itemCount: subjectData.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            subjectName = subjectData[index];
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(subjectData[index])
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
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
                                return null;
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
                                return null;
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
                                  EditMarkRequestService.postEditMarkRequest(
                                      subject: subjectName.toString(),
                                      mark: studentEMRGainedMarkController.text
                                          .toString(),
                                      reason: markEditingRequestTextController
                                          .text
                                          .toString(),
                                      teacher: teacherName.toString());
                                  isLoading = false;
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => CustomDialog(
                                        title: 'إرسال طلب تعديل العلامة',
                                        onPressed: () {
                                          studentEMRGainedMarkController
                                              .clear();
                                          markEditingRequestTextController
                                              .clear();
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
          );
        }),
      ),
    );
  }
}
