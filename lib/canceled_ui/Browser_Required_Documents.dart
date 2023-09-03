// import 'package:flutter/material.dart';

// import '../Components/Buttons.dart';
// import '../Components/CustomAppBar.dart';
// import '../Components/Dialogs.dart';
// import '../Components/Documents_card.dart';
// import '../Components/Label.dart';
// import '../Browsers_Screens/Browser_Course_Page.dart';

// class BrowserRequiredDocuments extends StatefulWidget {
//   const BrowserRequiredDocuments({super.key});

//   static String id = 'BrowserRequiredDocuments';

//   @override
//   State<BrowserRequiredDocuments> createState() =>
//       _BrowserRequiredDocumentsState();
// }

// GlobalKey<FormState> formState = GlobalKey<FormState>();

// class _BrowserRequiredDocumentsState extends State<BrowserRequiredDocuments> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
//       body: Form(
//         key: formState,
//         child: Column(children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               labelStyle(text: 'الأوراق المطلوبة'),
//             ],
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           documentsCard(title: 'صورة عن الهوية'),
//           const SizedBox(
//             height: 15,
//           ),
//           documentsCard(title: 'صورة مصدقة عن الشهادة التي يحملها الطالب'),
//           const Spacer(
//             flex: 1,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               nextButton(
//                   text: 'إنهاء',
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => CustomDialog(
//                           title: 'الإنتساب للدورة',
//                           onPressed: () {
//                             if (formState.currentState!.validate()) {
//                               Navigator.of(context)
//                                 ..pop()
//                                 ..pop()
//                                 ..pop()
//                                 ..pop();
//                             }
//                           }),
//                     );
//                   }),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//         ]),
//       ),
//     );
//   }
// }
