import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import '../Components/Notes.dart';
import '../Components/loaing.dart';
import '../api/models/note_model.dart';
import '../api/services/note_services.dart';
import 'Student_Adding_Notes.dart';
import 'Student_Editing_Notes.dart';

class StudentProfileNotesPage extends StatefulWidget {
  const StudentProfileNotesPage({super.key});
  static String id = 'StudentProfileNotesPage';

  @override
  State<StudentProfileNotesPage> createState() =>
      _StudentProfileNotesPageState();
}

class _StudentProfileNotesPageState extends State<StudentProfileNotesPage> {
  List notes = [];
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
          child: FutureBuilder<List<NoteModel>>(
              future: NoteServices.getNote(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final notes = snapshot.data!;
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Note(note: notes[index], 
                    onEditPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StudentEditingNotes(),
                      ));
                    },
                    onDeletePressed: () {},
                    noteTitle: notes[index].title,
                    noteClassification: notes[index].category,
                    noteText: notes[index].description,
                  ),
                );
              }),
        ));
  }
}
