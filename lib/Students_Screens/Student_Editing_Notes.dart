import 'package:dtc_app/api/services/note_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/TextField.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class StudentEditingNotes extends StatefulWidget {
  const StudentEditingNotes({super.key});
  static String id = '/StudentEditingNotes';

  @override
  State<StudentEditingNotes> createState() => _StudentEditingNotesState();
}

class _StudentEditingNotesState extends State<StudentEditingNotes> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: CustomAppBar(title: 'تعديل الملاحظة'),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height - 92,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 30, right: 15),
                        child: Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'التصنيف'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentEditingNoteClassification,
                                keyboardType: TextInputType.none,
                                radius: 20,
                                validator: (text) {
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 30, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'عنوان الملاحظة'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              controller: studentEditingNoteTitle,
                              keyboardType: TextInputType.name,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 30, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'نص الملاحظة'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              maxLines: 6,
                              controller: studentEditingNoteText,
                              keyboardType: TextInputType.name,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
                                return null;
                              },
                            )
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
                              text: 'تعديل',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  print('tapped');
                                  isLoading = true;
                                  final note = await NoteServices.putNote(
                                      title: studentEditingNoteTitle.text
                                          .toString(),
                                      description: studentEditingNoteText.text
                                          .toString(),
                                      category:
                                          studentEditingNoteCLassificationVariable !=
                                                  ''
                                              ? studentEditingNoteCLassificationVariable
                                                  .toString()
                                              : studentEditingNoteClassification
                                                  .text
                                                  .toString(),
                                      id: studentEditingNoteIdVariable);
                                  isLoading = false;
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => CustomDialog(
                                        onPressed: () {
                                          studentEditingNoteTitle.clear();
                                          studentEditingNoteText.clear();
                                          studentEditingNoteClassification
                                              .clear();
                                          Navigator.of(context)
                                            ..pop()
                                            ..pop(note);
                                        },
                                        title: 'تعديل الملاحظة'),
                                  );
                                }
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
