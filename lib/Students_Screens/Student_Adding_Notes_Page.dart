import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/CustomAppBar.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';

class StudentAddingNotesPage extends StatefulWidget {
  const StudentAddingNotesPage({super.key});
  static String id = 'StudentAddingNotesPage';

  @override
  State<StudentAddingNotesPage> createState() => _StudentAddingNotesPageState();
}

class _StudentAddingNotesPageState extends State<StudentAddingNotesPage> {
  final classificationNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: 'إضافة ملاحظة'),
      body: Form(
          child: SingleChildScrollView(
              child: Container(
        height: height - 92,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  registrationDropDownSearch(
                      hint: 'إختر تصنيف',
                      items: [],
                      onChange: (data) {},
                      validator: (data) {}),
                  const SizedBox(
                    width: 15,
                  ),
                  registrationInfoTextField(
                    controller: classificationNote,
                    keyboardType: TextInputType.name,
                    radius: 25,
                    validator: (text) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,)
          ],
        ),
      ))),
    );
  }
}
