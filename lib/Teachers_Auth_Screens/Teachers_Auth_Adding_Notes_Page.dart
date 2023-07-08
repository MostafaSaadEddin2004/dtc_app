import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Components/CustomAppBar.dart';

class TeachersAuthAddingNotesPage extends StatefulWidget {
  const TeachersAuthAddingNotesPage({super.key});
  static String id = 'TeachersAuthAddingNotesPage';

  @override
  State<TeachersAuthAddingNotesPage> createState() => _TeachersAuthAddingNotesPageState();
}

class _TeachersAuthAddingNotesPageState extends State<TeachersAuthAddingNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'إضافة ملاحظة'));
  }
}
