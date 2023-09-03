import 'package:dtc_app/Components/loaing.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Constants/Controller.dart';
import 'package:dtc_app/api/models/note_model.dart';
import 'package:flutter/material.dart';
import '../Components/Notes.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/services/note_services.dart';
import 'Student_Adding_Notes.dart';
import 'Student_Editing_Notes.dart';
import 'Student_Profile_Page.dart';

class StudentNotesPage extends StatefulWidget {
  const StudentNotesPage({super.key});
  static String id = 'StudentNotesPage';

  @override
  State<StudentNotesPage> createState() => _StudentNotesPageState();
}

class _StudentNotesPageState extends State<StudentNotesPage> {
  List notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              final NoteModel? note = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudentAddingNotes(),
                ),
              );
              if (note != null) {
                notes.add(note);
                setState(() {});
              }
            },
            child: const Icon(
              Icons.add,
              size: 40,
              color: WhiteColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'IT / IT',
                style: TextStyle(
                    color: WhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: PrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (contex) {
                        return StudentProfilePage();
                      }));
                    },
                    child: const CircleAvatar(
                      minRadius: 30,
                      maxRadius: 30,
                      backgroundColor: WhiteColor,
                      child: Icon(
                        Icons.person,
                        color: PrimaryColor,
                        size: 45,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text(
                        'إسم المستخدم',
                        style: TextStyle(
                            color: WhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '1A2B3C',
                        style: TextStyle(
                          color: WhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: WhiteColor, thickness: 2),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.people,
                      color: WhiteColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'دعوة صديق',
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignUpType.id);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app_rounded,
                      color: RedColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          color: RedColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: FutureBuilder<List<NoteModel>>(
              future: NoteServices.getNote(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final notes = snapshot.data!;
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Note(
                    note: notes[index],
                    onEditPressed: () async {
                      studentEditingNoteClassification.text =
                          notes[index].category;
                      studentEditingNoteText.text = notes[index].description;
                      studentEditingNoteTitle.text = notes[index].title;
                      studentEditingNoteIdVariable = notes[index].id;
                      studentEditingNoteCLassificationVariable = '';
                      final NoteModel? note =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StudentEditingNotes(),
                      ));
                      if (note != null) {
                        notes.add(note);
                      }
                      setState(() {});
                    },
                    onDeletePressed: () async{
                      final deleteNote =
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
