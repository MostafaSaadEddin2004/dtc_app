import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';

class BrowserLanguagePage extends StatefulWidget {
  const BrowserLanguagePage({super.key});
  static String id = '/BrowserLanguagePage';

  @override
  State<BrowserLanguagePage> createState() => _BrowserLanguagePageState();
}

class _BrowserLanguagePageState extends State<BrowserLanguagePage> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: labelFont(text: 'Languages'),
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
