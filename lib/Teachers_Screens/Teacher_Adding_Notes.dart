import 'package:flutter/material.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class TeacherAddingNotes extends StatefulWidget {
  const TeacherAddingNotes({super.key});

  @override
  State<TeacherAddingNotes> createState() => _TeacherAddingNotesState();
}

class _TeacherAddingNotesState extends State<TeacherAddingNotes> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        TextFormField(
                            onChanged: (data) {},
                            controller: teacherNoteTitle,
                            validator: (text) {},
                            keyboardType: TextInputType.name,
                            enabled: true,
                            cursorColor: GreyColor,
                            decoration: InputDecoration(
                              hintText: 'أكتب هنا...',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: GreyColor),
                              ),
                            )),
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
                        TextFormField(
                            onChanged: (data) {},
                            controller: teacherNoteText,
                            validator: (text) {},
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
                      nextButton(
                          text: 'إنهاء',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                  onPressed: () {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
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
        ));
  }
}
