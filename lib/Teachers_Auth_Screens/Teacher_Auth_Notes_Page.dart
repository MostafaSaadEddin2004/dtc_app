import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Constants/Controller.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/blocs/get_user_information/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/Notes.dart';
import '../Components/loading.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/models/note_model.dart';
import '../api/services/note_services.dart';
import 'Teacher_Auh__Editing_Notes.dart';
import 'Teacher_Auth_Adding_Notes.dart';
import 'Teacher_Auth_Profile_Page.dart';

class TeacherAuthNotesPage extends StatefulWidget {
  const TeacherAuthNotesPage({super.key});
  static String id = '/TeacherAuthNotesPage';

  @override
  State<TeacherAuthNotesPage> createState() => _TeacherAuthNotesPageState();
}

class _TeacherAuthNotesPageState extends State<TeacherAuthNotesPage> {
  List notes = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserInformationCubit()..fetchData(),
      child: Builder(builder: (context) {
        final state =
            BlocProvider.of<GetUserInformationCubit>(context, listen: true)
                .state;
        if (state is! GetUserInformationFetched) return Loading();
        final userData = state.userData;
        {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: PrimaryColor,
                  onPressed: () async {
                    final NoteModel? note =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TeacherAuthAddingNotes(),
                    ));
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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              appBar: AppBar(
                backgroundColor: PrimaryColor,
                actions: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${userData.section}',
                      style: TextStyle(
                          color: WhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              drawer: Drawer(
                  backgroundColor: PrimaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 50, right: 15),
                    child: Column(children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .popAndPushNamed(TeacherAuthProfilePage.id);
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: WhiteColor,
                              backgroundImage: NetworkImage(
                                  userData.image != null
                                      ? userData.image!
                                      : 'assets/images/person.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                userData.first_name_en.toString() +
                                    ' ' +
                                    userData.last_name_en.toString(),
                                style: TextStyle(
                                    color: WhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                userData.email.toString(),
                                style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 10,
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
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthServices.postLogout();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            SignUpType.id,
                            (Route<dynamic> route) => false,
                          );
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
                  )),
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
                            teacherAuthEditingNoteClassification.text =
                                notes[index].category;
                            teacherAuthEditingNoteText.text =
                                notes[index].description;
                            teacherAuthEditingNoteTitle.text =
                                notes[index].title;
                            teacherAuthEditingNoteIdVariable = notes[index].id;
                            teacherAuthEditingNoteCLassificationVariable = '';
                            final NoteModel? note = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) =>
                                  const TeacherAuthEditingNotes(),
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
      }),
    );
  }
}
