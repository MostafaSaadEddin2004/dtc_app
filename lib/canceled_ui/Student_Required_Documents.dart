// import 'package:dtc_app/Components/CustomAppBar.dart';
// import 'package:flutter/material.dart';
// import '../Components/Buttons.dart';
// import '../Components/Dialogs.dart';
// import '../Components/Documents_card.dart';
// import '../Components/Label.dart';
// import '../Constants/Colors.dart';

// class StudentRequiredDocuments extends StatefulWidget {
//   const StudentRequiredDocuments({super.key});
//   static String id = 'StudentRequiredDocuments';

//   @override
//   State<StudentRequiredDocuments> createState() =>
//       _StudentRequiredDocumentsState();
// }

// class _StudentRequiredDocumentsState extends State<StudentRequiredDocuments> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
//       body: Column(children: [
//         const SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             labelStyle(text: 'الأوراق المطلوبة'),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         documentsCard(title: 'صورة عن الهوية'),
//         const SizedBox(
//           height: 15,
//         ),
//         documentsCard(title: 'صورة مصدقة عن الشهادة التي يحملها الطالب'),
//         const Spacer(
//           flex: 1,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             nextButton(
//                 text: 'إنهاء',
//                 onTap: () {
//                   // Navigator.of(context)
//                   //   ..pop()
//                   //   ..pop()
//                   //   ..pop();
//                   showDialog(
//                     context: context,
//                     builder: (context) => CustomDialog(
//                         title: 'الإنتساب للدورة',
//                         onPressed: () {
//                           Navigator.of(context)
//                             ..pop()
//                             ..pop()
//                             ..pop()
//                             ..pop();
//                         }),
//                   );
//                 }),
//           ],
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//       ]),
//     );
//   }
// }
