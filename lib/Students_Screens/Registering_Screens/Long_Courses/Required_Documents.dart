import 'package:flutter/material.dart';

import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Documents_card.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';
import '../../Student_Start_Page.dart';

class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({super.key});
  static String id = "RequiredDocuments";

  @override
  State<RequiredDocuments> createState() => _RequiredDocumentsState();
}

GlobalKey<FormState> formState = GlobalKey<FormState>();

class _RequiredDocumentsState extends State<RequiredDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
          key: formState,
          child: Container(
            child: Column(
              children: [
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
                documentsCard(
                    title: 'صورة عن إخراج القيد أو صورة عن الهوية الشخصية'),
                const SizedBox(
                  height: 15,
                ),
                documentsCard(
                    title: 'صورة مصدقة عن الشهادة التي يحملها الطالب'),
                const SizedBox(
                  height: 15,
                ),
                documentsCard(title: 'صورة شخصية'),
                const SizedBox(
                  height: 15,
                ),
                documentsCard(title: 'صورة عن بطاقة الوكالة'),
                const SizedBox(
                  height: 15,
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    nextButton(
                        text: 'إنهاء',
                        onTap: () {
                          if (formState.currentState!.validate()) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              StudentStartPage.id,
                              (Route<dynamic> route) => false,
                            );
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
