import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';

import '../Components/Notes.dart';
import 'Student_Adding_Notes_Page.dart';
import 'Student_Profile_Page.dart';

class StudentProfileNotesPage extends StatefulWidget {
  const StudentProfileNotesPage({super.key});
  static String id = 'StudentProfileNotesPage';

  @override
  State<StudentProfileNotesPage> createState() =>
      _StudentProfileNotesPageState();
}

class _StudentProfileNotesPageState extends State<StudentProfileNotesPage> {
  List note = const [
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'NoteText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: PrimaryColor,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentAddingNotesPage(),
              ));},
            child: const Icon(
              Icons.add,
              size: 40,
              color: WhiteColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: note.length,
            itemBuilder: (context, index) => notes(
              noteTitle: note[index]['NoteTitle'].toString(),
              noteClassification: note[index]['NteClassification'].toString(),
              noteText: note[index]['NoteText'].toString(),
            ),
          ),
        ));
  }
}
