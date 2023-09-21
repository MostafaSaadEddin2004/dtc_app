import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:flutter/material.dart';

class StudentLanguagePage extends StatefulWidget {
  const StudentLanguagePage({super.key});
  static String id = '/StudentLanguagePage';

  @override
  State<StudentLanguagePage> createState() => _StudentLanguagePageState();
}

class _StudentLanguagePageState extends State<StudentLanguagePage> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: labelFont(text: 'Language'),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: GreyColor, width: 0.5)),
              color: WhiteColor,
            ),
            child: RadioListTile(
              title: const Text('English'),
              value: 1,
              groupValue: _selectedValue,
              activeColor: PrimaryColor,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: GreyColor, width: 0.5)),
              color: WhiteColor,
            ),
            child: RadioListTile(
              title: const Text('Arabic'),
              value: 2,
              groupValue: _selectedValue,
              activeColor: PrimaryColor,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
