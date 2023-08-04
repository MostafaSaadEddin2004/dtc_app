import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';

class BrowserTonePage extends StatefulWidget {
  const BrowserTonePage({super.key});
  static String id = 'BrowserTonePage';

  @override
  State<BrowserTonePage> createState() => _BrowserTonePageState();
}

class _BrowserTonePageState extends State<BrowserTonePage> {
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
        title: titleText(text: 'Notification Tone'),
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
