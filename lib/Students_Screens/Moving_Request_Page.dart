import 'package:flutter/material.dart';

import '../Components/Buttons.dart';
import '../Components/DropDownSearch.dart';
import '../Components/Label.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class MovingRequestPage extends StatefulWidget {
  const MovingRequestPage({super.key});
  static String id = 'MovingRequestPage';

  @override
  State<MovingRequestPage> createState() => _MovingRequestPageState();
}

class _MovingRequestPageState extends State<MovingRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('طلب الإنتقال'),
      ),
      body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              height: height - 92,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'القسم المراد الإنتقال إليه'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [
                                    'تكنولوجيا المعلومات',
                                    'الطبي',
                                    'الهندسي',
                                    'التجاري',
                                    'الميكانيكي'
                                  ],
                                  onChange: (data) {
                                    newDepartment = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الفرع المراد الإنتقال إليه'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [],
                                  onChange: (data) {
                                    newClass = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'مجموع العلامات دون مادة الديانة'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          controller: studentMRMarkController,
                          keyboardType: TextInputType.number,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            } else if (int.parse(text) < 0 ||
                                int.parse(text) > 2700) {
                              return 'العلامة يجب أن تكون بين 0 - 2700';
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'نص طلب الإنتقال'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          maxLines: 6,
                          controller: movingRequestTextController,
                          keyboardType: TextInputType.text,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
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
                  )
                ],
              ),
            ),
          )),
    );
  }
}
