import 'package:dtc_app/Components/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../../Components/Buttons.dart';
import '../../Components/Documents_card.dart';
import '../../Components/Label.dart';
import '../../Constents/Colors.dart';
import '../../Students_Screens/Courses_and_Posts/Student_Course_Page.dart';

class StudentRequiredDocuments extends StatefulWidget {
  const StudentRequiredDocuments({super.key});
  static String id = 'StudentRequiredDocuments';

  @override
  State<StudentRequiredDocuments> createState() =>
      _StudentRequiredDocumentsState();
}

class _StudentRequiredDocumentsState extends State<StudentRequiredDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            labelStyle(text: 'الأوراق المطلوبة'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        documentsCard(title: 'صورة عن الهوية'),
        const SizedBox(
          height: 15,
        ),
        documentsCard(title: 'صورة مصدقة عن الشهادة التي يحملها الطالب'),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            nextButton(
                text: 'إنهاء',
                onTap: () {
                  
                }),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
