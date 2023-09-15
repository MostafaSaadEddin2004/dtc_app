import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/DropDownSearch.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constants/Controller.dart';
import '../../../Constants/TextStyle.dart';
import 'Required_Documents.dart';

class StudentCertification extends StatefulWidget {
  const StudentCertification({super.key});
  static String id = "StudentCertification";

  @override
  State<StudentCertification> createState() => _StudentCertificationState();
}

class _StudentCertificationState extends State<StudentCertification> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
          key: formState,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  labelStyle(text: 'الشهادة التي يحملها الطالب'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              titleText(text: 'مجموع العلامات دون مادة الديانة'),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: registrationInfoTextField(
                    controller: studentTotalDegreesController,
                    keyboardType: TextInputType.number,
                    radius: 20,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      } else if (int.parse(text) < 0 ||
                          int.parse(text) > 2700) {
                        return 'العلامة يجب أن تكون بين 0 - 2700';
                      }return null;
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              titleText(text: 'سنة الحصول على الشهادة'),
              const SizedBox(
                height: 10,
              ),
              registrationDropDownSearch(
                  hint: '',
                  items: [
                    '2018-2019',
                    '2019-2020',
                    '2020-2021',
                    '2021-2022',
                    '2022-2023'
                  ],
                  onChange: (data) {
                    certificationDate = data!;
                  },
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'الحقل مطلوب';
                    }return null;
                  }),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(
                      text: 'التالي',
                      onTap: () {
                        if (formState.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  const RequiredDocuments())));
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
