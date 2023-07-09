import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Wishes.dart';
import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';
import '../../../Components/TextField.dart';
import '../../../Constents/Colors.dart';
import '../../../Constents/TextStyle.dart';
import 'Required_Documents.dart';
import 'package:date_time_picker/date_time_picker.dart';

class StudentCertification extends StatefulWidget {
  const StudentCertification({super.key});
  static String id = "StudentCertification";

  @override
  State<StudentCertification> createState() => _StudentCertificationState();
}

class _StudentCertificationState extends State<StudentCertification> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController totalDegreesController = TextEditingController();
  TextEditingController certificationDateController = TextEditingController();
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
              titleText(text: 'المعدل دون مادة الديانةٍ'),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // decoration: BoxDecoration(
                //   color: WhiteColor,
                //   borderRadius: BorderRadius.circular(20),
                //   boxShadow: const [
                //     BoxShadow(
                //       color: GreyColor,
                //       blurRadius: 2,
                //       offset: Offset(2, 2), // Shadow position
                //     ),
                //   ],
                // ),
                child: TextFormField(
                    onChanged: (data) {},
                    controller: totalDegreesController,
                    validator: (text) {},
                    keyboardType: TextInputType.number,
                    enabled: true,
                    cursorColor: GreyColor,
                    decoration: InputDecoration(
                      hintText: 'أكتب هنا...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: GreyColor),
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              titleText(text: 'سنة الحصول على الشهادة'),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // decoration: BoxDecoration(
                //   color: WhiteColor,
                //   borderRadius: BorderRadius.circular(20),
                //   boxShadow: const [
                //     BoxShadow(
                //       color: GreyColor,
                //       blurRadius: 2,
                //       offset: Offset(2, 2), // Shadow position
                //     ),
                //   ],
                // ),
                child: TextFormField(
                    onChanged: (data) {},
                    controller: certificationDateController,
                    validator: (text) {},
                    keyboardType: TextInputType.datetime,
                    enabled: true,
                    cursorColor: GreyColor,
                    decoration: InputDecoration(
                      suffixIconColor: BlackColor,
                      hintText: 'أنقر على الرمز لاختيار التاريخ...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () async {
                          dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2024),
                              keyboardType: TextInputType.datetime);
                          certificationDateController.text =
                              '${dateTime?.day} / ${dateTime?.month} / ${dateTime?.year}';
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: GreyColor),
                      ),
                    )),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(
                      text: 'التالي',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const RequiredDocuments())));
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
