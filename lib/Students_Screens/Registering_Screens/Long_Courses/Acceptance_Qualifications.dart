import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Comparison_Screen.dart';
import 'package:flutter/material.dart';

import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Label.dart';

class AcceptanceQualifications extends StatefulWidget {
  const AcceptanceQualifications({super.key});

  static String id = 'AcceptanceQualifications';

  @override
  State<AcceptanceQualifications> createState() =>
      _AcceptanceQualificationsState();
}

GlobalKey<FormState> formState = GlobalKey<FormState>();

class _AcceptanceQualificationsState extends State<AcceptanceQualifications> {
  @override
  Widget build(BuildContext context) {
    // var certification = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: CustomAppBar(title: 'طلب الانتساب'),
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              children: [
                Row(
                  children: [labelStyle(text: 'شروط القبول لطلاب الثانوي')],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Text(
                        '1- تُقبل شهادات المرحلة الثانوية دورة عام التسجيل',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '2- أن يكون المتقدم دون سن 22 سنة بتاريخ 10/1 في سنة التسجيل',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                              text: '3- لائقاً صحياً',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '(تقبل طلبات ذوي الإعاقة وتُدرس خصوصية كل حالة على حدة شرط استيفاء شروط القبول)',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '4- أن يتناسب مجموع العلامات مع الحد الأدنى للعلامات المطلوبة للإشتراك بالمفاضلة الأولى',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '5- أن يكون المتقدم من أبناء لاجئي فلسطين المسجلين في قيود الوكالة',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '6- يبدأ التسجيل اعتباراً من 1 آب ولغاية 2 أيلول',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                              text:
                                  '7- تُقبل طلبات المتقدمين لمن تجاوز عمرعم 22 سنة بتاريخ 10/1',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'شرطياً في قائمة الإحتياط',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                              text:
                                  '8- تُقبل طلبات المتقدمين الذين لم يحصلوا على',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'الحد  الأدنى للعلامات ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'المطلوبة للإشتراك بالمفاضلة الأولى ',
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextSpan(
                                  text: 'شرطياً في قائمة الإحتياط ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [labelStyle(text: 'شروط القبول لطلاب الإعدادي')],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Text(
                        '1- تُقبل شهادات المرحلة الإعدادية دورة عام التسجيل',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '2- أن يكون المتقدم دون سن 19 سنة بتاريخ 10/1 في سنة التسجيل',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                              text: '3- لائقاً صحياً',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '(تقبل طلبات ذوي الإعاقة وتُدرس خصوصية كل حالة على حدة شرط استيفاء شروط القبول)',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '4- أن يتناسب مجموع العلامات مع الحد الأدنى للعلامات المطلوبة للإشتراك بالمفاضلة الأولى',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '5- أن يكون المتقدم من أبناء لاجئي فلسطين المسجلين في قيود الوكالة',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '6- يبدأ التسجيل اعتباراً من 1 آب ولغاية 2 أيلول',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                              text:
                                  '7- تُقبل طلبات المتقدمين لمن تجاوز عمرعم 19 سنة بتاريخ 10/1',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'شرطياً في قائمة الإحتياط',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    nextButton(
                        text: 'التالي',
                        onTap: () {
                          if (formState.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ComparisonScreen()));
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
