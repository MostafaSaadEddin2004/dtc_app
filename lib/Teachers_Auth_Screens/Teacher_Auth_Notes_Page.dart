import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';

import '../Components/Notes.dart';
import '../SignUp_Type.dart';
import 'Teacher_Auth_Profile_Page.dart';

class TeacherAuthNotesPage extends StatefulWidget {
  const TeacherAuthNotesPage({super.key});
  static String id = 'TeacherAuthNotesPage';

  @override
  State<TeacherAuthNotesPage> createState() => _TeacherAuthNotesPageState();
}

class _TeacherAuthNotesPageState extends State<TeacherAuthNotesPage> {
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
            onPressed: () {},
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
                        return TeacherAuthProfilePage();
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
                      Icons.location_on,
                      color: WhiteColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'موقع المعهد',
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
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpType.id);
                },
                child: Row(
                  children: const [
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          color: RedColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.exit_to_app_rounded,
                      color: RedColor,
                      size: 30,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
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
