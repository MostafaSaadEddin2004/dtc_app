import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';

var anoteAddingController = TextEditingController();
var noteTitleController = TextEditingController();
var noteTextController = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey<FormState>();
String selectedClassification = 'التصنيف الاول';

class TeacherAuthAddingNotes extends StatefulWidget {
  const TeacherAuthAddingNotes({super.key});

  @override
  State<TeacherAuthAddingNotes> createState() => _TeacherAuthAddingNotesState();
}

class _TeacherAuthAddingNotesState extends State<TeacherAuthAddingNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'إضافة ملاحظة'),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 92,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  ' اختيار التصنيف : ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 49,
                              padding: const EdgeInsetsDirectional.only(
                                  end: 6, start: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: const Color(0xff333333),
                                  width: 0.4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(5.0, 9.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: DropdownButton(
                                iconSize: 30,
                                isExpanded: true,
                                items: const [
                                  DropdownMenuItem(
                                    // ignore: sort_child_properties_last
                                    child: Text(
                                      'التصنيف الاول',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    value: 'التصنيف الاول',
                                  ),
                                  DropdownMenuItem(
                                    // ignore: sort_child_properties_last
                                    child: Text(
                                      'التصنيف الثاني',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    value: 'التصنيف الثاني',
                                  ),
                                ],
                                onChanged: (String? val) {
                                  setState(() {
                                    selectedClassification = val!;
                                  });
                                },
                                value: selectedClassification,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'اضافة التصنيف : ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(5.0, 9.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                border: Border.all(width: 0.2),
                                borderRadius: BorderRadius.circular(6.0),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null) {
                                    return 'هذا حقل مطلوب';
                                  }
                                },
                                style: const TextStyle(
                                  color: Color(0xFF333333),
                                ),
                                controller: anoteAddingController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: '  ',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            ' عنوان الملاحظة : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(5.0, 9.0),
                              blurRadius: 3.0,
                            ),
                          ],
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value != null) {
                              return 'هذا حقل مطلوب';
                            }
                          },
                          style: const TextStyle(
                            color: Color(0xFF333333),
                          ),
                          controller: noteTitleController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: ' ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'نص الملاحظة : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(5.0, 9.0),
                              blurRadius: 3.0,
                            ),
                          ],
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value != null) {
                              return 'هذا حقل مطلوب';
                            }
                          },
                          style: const TextStyle(
                            // height: 50,
                            color: Color(0xFF333333),
                          ),
                          controller: noteTextController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: ' ',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            border: InputBorder.none,
                          ),
                        ),
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
                    nextButton(text: 'إضافة', onTap: () {}),
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
