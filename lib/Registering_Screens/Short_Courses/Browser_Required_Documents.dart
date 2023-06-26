import 'package:flutter/material.dart';

import '../../Browsers_Screens/Browser_Course_Page.dart';
import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Components/Documents_card.dart';
import '../../Components/Label.dart';
import '../../Constents/Colors.dart';

class BrowserRequiredDocuments extends StatefulWidget {
  const BrowserRequiredDocuments({super.key});
  static String id = 'BrowserRequiredDocuments';

  @override
  State<BrowserRequiredDocuments> createState() =>
      _BrowserRequiredDocumentsState();
}

class _BrowserRequiredDocumentsState extends State<BrowserRequiredDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            labelStyle(text: 'الأوراق المطلوبة'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        documentsCard(title: 'صورة عن الهوية'),
        const SizedBox(
          height: 15,
        ),
        documentsCard(title: 'صورة مصدقة عن الشهادة التي يحملها الطالب'),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            nextButton(text: 'إنهاء', onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
