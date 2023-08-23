import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import '../api/services/note_services.dart';

class TeacherAddingNotes extends StatefulWidget {
  const TeacherAddingNotes({super.key});

  @override
  State<TeacherAddingNotes> createState() => _TeacherAddingNotesState();
}

class _TeacherAddingNotesState extends State<TeacherAddingNotes> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: CustomAppBar(title: 'إضافة ملاحظة'),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                titleText(text: 'التصنيف'),
                                const SizedBox(
                                  height: 10,
                                ),
                                registrationDropDownSearch(
                                    hint: 'إختر',
                                    items: [],
                                    onChange: (data) {
                                      teacherNoteClassificationVariable = data!;
                                    },
                                    validator: (data) {})
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                titleText(text: 'التصنيف'),
                                const SizedBox(
                                  height: 10,
                                ),
                                registrationInfoTextField(
                                  controller: teacherNoteClassification,
                                  keyboardType: TextInputType.name,
                                  radius: 20,
                                  validator: (text) {},
                                )
                              ],
                            ),
                          ),
                        ],
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
                            controller: teacherNoteTitle,
                            keyboardType: TextInputType.name,
                            radius: 20,
                            validator: (text) {},
                          ),
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
                            controller: teacherNoteText,
                            keyboardType: TextInputType.name,
                            radius: 20,
                            validator: (text) {},
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
                            text: 'إضافة',
                            onTap: () async {
                              isLoading = true;
                              final note = await NoteServices.postNote(
                                  title: teacherNoteTitle.text.toString(),
                                  description:
                                      teacherNoteText.text.toString(),
                                  category_name: teacherNoteClassification
                                      .text
                                      .toString());
                              isLoading = false;
                              showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                    onPressed: () {
                                      teacherNoteTitle.clear();
                                      teacherNoteText.clear();
                                      teacherNoteClassification.clear();
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop(note);
                                    },
                                    title: 'إضافة الملاحظة'),
                              );
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
          )),
    );
  }
}
