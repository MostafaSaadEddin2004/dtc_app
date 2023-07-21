import 'package:dtc_app/Constents/Colors.dart';
import 'package:dtc_app/Constents/TextStyle.dart';
import 'package:flutter/material.dart';

class StudentNotificationTonePage extends StatefulWidget {
  const StudentNotificationTonePage({super.key});
  static String id = 'StudentNotificationTonePage';

  @override
  State<StudentNotificationTonePage> createState() =>
      _StudentNotificationTonePageState();
}

class _StudentNotificationTonePageState
    extends State<StudentNotificationTonePage> {
  List tones = const [
    'Default',
    'None',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
    'Tone',
  ];
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: labelFont(text: 'Notification Tone'),
        backgroundColor: PrimaryColor,
      ),
      body: ListView.builder(
        itemCount: tones.length,
        itemBuilder: (context, index) => Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: GreyColor, width: 0.5)),
            color: WhiteColor,
          ),
          child: RadioListTile(
            title: Text(tones[index]),
            value: index,
            groupValue: _selectedValue,
            activeColor: PrimaryColor,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
