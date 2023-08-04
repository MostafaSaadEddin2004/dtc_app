import 'package:flutter/material.dart';
import '../Components/CustomAppBar.dart';

class TeachersAddingNotesPage extends StatefulWidget {
  const TeachersAddingNotesPage({super.key});
  static String id = 'TeachersAddingNotesPage';

  @override
  State<TeachersAddingNotesPage> createState() =>
      _TeachersAddingNotesPageState();
}

class _TeachersAddingNotesPageState extends State<TeachersAddingNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'إضافة ملاحظة'));
  }
}
