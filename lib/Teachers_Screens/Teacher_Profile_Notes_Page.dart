import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Constants/Controller.dart';
import 'package:flutter/material.dart';

import '../Components/Notes.dart';
import '../Components/loading.dart';
import '../api/models/note_model.dart';
import '../api/services/note_services.dart';
import 'Teacher_Adding_Notes.dart';
import 'Teacher_Editing_Notes.dart';

class TeacherProfileNotesPage extends StatefulWidget {
  const TeacherProfileNotesPage({super.key});
  static String id = '/TeacherProfileNotesPage';

  @override
  State<TeacherProfileNotesPage> createState() =>
      _TeacherProfileNotesPageState();
}

class _TeacherProfileNotesPageState extends State<TeacherProfileNotesPage> {
  List notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: PrimaryColor,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TeacherAddingNotes(),
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
                notes = snapshot.data!;
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Note(
                    note: notes[index],
                    onEditPressed: () async {
                      teacherEditingNoteClassification.text =
                          notes[index].category;
                      teacherAuthEditingNoteText.text =
                          notes[index].description;
                      teacherEditingNoteTitle.text = notes[index].title;
                      teacherEditingNoteIdVariable = notes[index].id;
                      teacherEditingNoteClassificationVariable = '';
                      final NoteModel? note =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TeacherEditingNotes(),
                      ));
                      if (note != null) {
                        notes.add(note);
                      }
                      setState(() {});
                    },
                    onDeletePressed: () async {
                      await NoteServices.deleteNote(id: notes[index].id);
                      setState(() {});
                    },
                    noteTitle: notes[index].title,
                    noteClassification: notes[index].category,
                    noteText: notes[index].description,
                  ),
                );
              }),
        ));
  }
}
