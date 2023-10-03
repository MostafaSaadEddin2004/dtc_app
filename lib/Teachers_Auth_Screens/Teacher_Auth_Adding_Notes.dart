import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/api/models/note_category_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';
import '../api/services/note_services.dart';

class TeacherAuthAddingNotes extends StatefulWidget {
  const TeacherAuthAddingNotes({super.key});

  @override
  State<TeacherAuthAddingNotes> createState() => _TeacherAuthAddingNotesState();
}

class _TeacherAuthAddingNotesState extends State<TeacherAuthAddingNotes> {
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
                child: FutureBuilder<List<NoteCategoryModel>>(
                    future: NoteServices.getNoteCateogry(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Loading();
                      final notes = snapshot.data!;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 30, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      titleText(text: 'التصنيف'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: WhiteColor,
                                            border: Border.all(
                                                color: GreyColor, width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: GreyColor,
                                                  offset: Offset(2, 2)),
                                            ]),
                                        child: Row(
                                          children: [
                                            Text(teacherAuthNoteClassificationVariable ==
                                                    ''
                                                ? 'إختر...'
                                                : teacherAuthNoteClassificationVariable),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            GestureDetector(
                                              child: Icon(
                                                Icons.add_circle_rounded,
                                                color: PrimaryColor,
                                              ),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 15),
                                                    decoration: BoxDecoration(
                                                      color: WhiteColor,
                                                      border: Border.all(
                                                          color: GreyColor,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 15,
                                                        vertical: 200),
                                                    child: ListView.builder(
                                                      itemCount: notes.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            teacherAuthNoteClassification
                                                                .clear();
                                                            teacherAuthNoteClassificationVariable =
                                                                notes[index]
                                                                    .name;
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                              height: 50,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(notes[
                                                                          index]
                                                                      .name)
                                                                ],
                                                              )),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
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
                                      titleText(text: 'التصنيف'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      registrationInfoTextField(
                                        controller:
                                            teacherAuthNoteClassification,
                                        keyboardType: TextInputType.name,
                                        radius: 20,
                                        validator: (text) {
                                          return null;
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 30, right: 15),
                            child: Column(
                              children: [
                                titleText(text: 'عنوان الملاحظة'),
                                const SizedBox(
                                  height: 10,
                                ),
                                registrationInfoTextField(
                                  controller: teacherAuthNoteTitle,
                                  keyboardType: TextInputType.name,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 30, right: 15),
                            child: Column(
                              children: [
                                titleText(text: 'نص الملاحظة'),
                                const SizedBox(
                                  height: 10,
                                ),
                                registrationInfoTextField(
                                  maxLines: 6,
                                  controller: teacherAuthNoteText,
                                  keyboardType: TextInputType.name,
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
                                  text: 'إضافة',
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      isLoading = true;
                                      final note = await NoteServices.postNote(
                                          title: teacherAuthNoteTitle.text
                                              .toString(),
                                          description: teacherAuthNoteText.text
                                              .toString(),
                                          category_name:
                                              teacherAuthNoteClassificationVariable !=
                                                      ''
                                                  ? teacherAuthNoteClassificationVariable
                                                  : teacherAuthNoteClassification
                                                      .text
                                                      .toString());
                                      isLoading = false;
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                            onPressed: () {
                                              teacherAuthNoteTitle.clear();
                                              teacherAuthNoteText.clear();
                                              teacherAuthNoteClassification
                                                  .clear();
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop(note);
                                            },
                                            title: 'إضافة الملاحظة'),
                                      );
                                    }
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }),
              ),
            ),
          )),
    );
  }
}
