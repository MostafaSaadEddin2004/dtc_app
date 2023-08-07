import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import '../Components/Notes.dart';
import 'Student_Adding_Notes.dart';

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
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'NoteTitle': 'عنوان الملاحظة',
      'NteClassification': 'التصنيف',
      'Notetext':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: PrimaryColor,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentAddingNotes(),
              ));
            },
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
              onEditPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StudentAddingNotes(),
                ));
              },
              onDeletePressed: (){},
              noteTitle: note[index]['NoteTitle'].toString(),
              noteClassification: note[index]['NteClassification'].toString(),
              noteText: note[index]['Notetext'].toString(),
            ),
          ),
        ));
  }
}
