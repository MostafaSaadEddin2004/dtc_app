import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/DropDownSearch.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class StudentAddingNotes extends StatefulWidget {
  const StudentAddingNotes({super.key});

  @override
  State<StudentAddingNotes> createState() => _StudentAddingNotesState();
}

class _StudentAddingNotesState extends State<StudentAddingNotes> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'إضافة ملاحظة'),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 92,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 30, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'التصنيف'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: 'إختر',
                                  items: [],
                                  onChange: (data) {},
                                  validator: (data) {})
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'التصنيف'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentNoteClassification,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 30, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'عنوان الملاحظة'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onChanged: (data) {},
                            controller: studentNoteTitle,
                            validator: (text) {},
                            keyboardType: TextInputType.name,
                            enabled: true,
                            cursorColor: GreyColor,
                            decoration: InputDecoration(
                              hintText: 'أكتب هنا...',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: GreyColor),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 30, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'نص الملاحظة'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onChanged: (data) {},
                            controller: studentNoteText,
                            validator: (text) {},
                            keyboardType: TextInputType.text,
                            enabled: true,
                            cursorColor: GreyColor,
                            decoration: InputDecoration(
                              hintText: 'أكتب هنا...',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 50),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: GreyColor),
                              ),
                            )),
                      ],
                    ),
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
                            showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                  onPressed: () {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
                                  },
                                  title: 'إضافة الملاحظة'),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

























// Form(
//         key: formkey,
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height - 92,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   ' اختيار التصنيف : ',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               height: 49,
//                               padding: const EdgeInsetsDirectional.only(
//                                   end: 6, start: 6),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6),
//                                 border: Border.all(
//                                   color: const Color(0xff333333),
//                                   width: 0.4,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     offset: const Offset(5.0, 9.0),
//                                     blurRadius: 3.0,
//                                   ),
//                                 ],
//                                 color: const Color.fromARGB(255, 255, 255, 255),
//                               ),
//                               child: DropdownButton(
//                                 iconSize: 30,
//                                 isExpanded: true,
//                                 items: const [
//                                   DropdownMenuItem(
//                                     // ignore: sort_child_properties_last
//                                     child: Text(
//                                       'التصنيف الاول',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     value: 'التصنيف الاول',
//                                   ),
//                                   DropdownMenuItem(
//                                     // ignore: sort_child_properties_last
//                                     child: Text(
//                                       'التصنيف الثاني',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     value: 'التصنيف الثاني',
//                                   ),
//                                 ],
//                                 onChanged: (String? val) {
//                                   setState(() {
//                                     Selectedgender = val!;
//                                   });
//                                 },
//                                 value: Selectedgender,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: const [
//                                 Text(
//                                   'اضافة التصنيف : ',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     offset: const Offset(5.0, 9.0),
//                                     blurRadius: 3.0,
//                                   ),
//                                 ],
//                                 border: Border.all(width: 0.2),
//                                 borderRadius: BorderRadius.circular(6.0),
//                                 color: const Color.fromARGB(255, 255, 255, 255),
//                               ),
//                               child: TextFormField(
//                                 validator: (value) {
//                                   if (value != null) {
//                                     return 'هذا حقل مطلوب';
//                                   }
//                                 },
//                                 style: const TextStyle(
//                                   color: Color(0xFF333333),
//                                 ),
//                                 controller: emailcontroller,
//                                 keyboardType: TextInputType.name,
//                                 decoration: const InputDecoration(
//                                   hintText: '  ',
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 15, horizontal: 5),
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             ' عنوان الملاحظة : ',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w400),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               offset: Offset(5.0, 9.0),
//                               blurRadius: 3.0,
//                             ),
//                           ],
//                           border: Border.all(width: 0.2),
//                           borderRadius: BorderRadius.circular(6.0),
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                         ),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value != null) {
//                               return 'هذا حقل مطلوب';
//                             }
//                           },
//                           style: const TextStyle(
//                             color: Color(0xFF333333),
//                           ),
//                           controller: emailcontroller,
//                           keyboardType: TextInputType.name,
//                           decoration: const InputDecoration(
//                             hintText: ' ',
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15, horizontal: 5),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'نص الملاحظة : ',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w400),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               offset: const Offset(5.0, 9.0),
//                               blurRadius: 3.0,
//                             ),
//                           ],
//                           border: Border.all(width: 0.2),
//                           borderRadius: BorderRadius.circular(6.0),
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                         ),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value != null) {
//                               return 'هذا حقل مطلوب';
//                             }
//                           },
//                           style: const TextStyle(
//                             // height: 50,
//                             color: Color(0xFF333333),
//                           ),
//                           controller: emailcontroller,
//                           keyboardType: TextInputType.name,
//                           decoration: const InputDecoration(
//                             hintText: ' ',
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15, horizontal: 5),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     nextButton(text: 'إضافة', onTap: () {}),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),