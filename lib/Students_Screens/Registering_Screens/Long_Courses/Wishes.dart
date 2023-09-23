import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:dtc_app/api/services/comparison_service.dart';
import 'package:flutter/material.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({
    super.key,
    required this.certificateId,
  });
  static String id = '/WishesPage';
  final int certificateId;

  @override
  State<WishesPage> createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  int checkedCount = 0;
  List<String> wishesList = [
    'مساعد صيدلي',
    'فني مخبر طبي',
    'الكمبيوتر ونظم المعلومات',
    'مساعد مهندس مدني',
    'تكنولوجية الإتصالات',
    'المحاسبة',
    'المصارف والتأمين',
    'ميكاترونيكس',
    'مساعد مهندس آليات',
    'فني إلكترون وتكنولوجيا الحاسوب',
    'إدارة التسويق والأعمال الإلكترونية',
    'إدارة المشاريع',
    'مساعد مهندس معماري',
    'التصميم الإعلاني',
    'مساعد مهندس ديكور وتصميم داخلي'
  ];
  late List<Wish> wishes = wishesList.map((e) => Wish(e)).toList();
  List<int> specialtyIDs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلب الانتساب'),
      body: FutureBuilder(
        future: ComparisonService.getComparison(
            certificateType_id: widget.certificateId),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !mounted) return Loading();
          final wishData = snapshot.data!;
          return SingleChildScrollView(
              child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                labelStyle(text: 'إختر ست رغبات'),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 278,
              child: ListView.builder(
                  itemCount: wishData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: GreyColor),
                          borderRadius: BorderRadius.circular(5),
                          color: WhiteColor,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 2,
                                color: GreyColor,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(children: [
                        Text(wishData[index].name),
                        const Spacer(
                          flex: 1,
                        ),
                        IconButton(
                            onPressed: () {
                              if (checkedCount <= 5) {
                                checkedCount++;
                                wishes[index].selected = true;
                                specialtyIDs.add(wishData[index].id);
                                print(specialtyIDs);
                                setState(() {});
                              } else if (checkedCount == 6) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => warningDialog(
                                      title: 'إنتباه',
                                      message:
                                          'لا يمكن إختيار أكثر من ثلاث رغبات',
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                );
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.add_circle_rounded,
                              color: PrimaryColor,
                              size: 30,
                            )),
                      ]),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                labelStyle(text: 'الرغبات المختارة $checkedCount'),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 210,
              child: ListView.builder(
                  itemCount: wishes.where((element) => element.selected).length,
                  itemBuilder: (context, index) {
                    final wishes = this
                        .wishes
                        .where((element) => element.selected)
                        .toList();
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: GreyColor),
                          borderRadius: BorderRadius.circular(5),
                          color: WhiteColor,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 2,
                                color: GreyColor,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(children: [
                        Text('${index + 1}-  ${wishData[index].name}'),
                        const Spacer(
                          flex: 1,
                        ),
                        IconButton(
                            onPressed: () {
                              checkedCount--;
                              wishes[index].selected = false;
                              specialtyIDs.remove(wishData[index].id);
                              print(specialtyIDs);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.remove_circle_rounded,
                              color: RedColor,
                              size: 25,
                            )),
                      ]),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                nextButton(
                    onTap: () {
                      if (checkedCount == 6) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonalInformation(
                                  specialtyIDs: specialtyIDs,
                                )));
                      } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => warningDialog(
                              title: 'إنتباه',
                              message: 'يجب إختيار ثلاث رغبات أولاً',
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        );
                      }
                    },
                    text: 'التالي'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ]));
        },
      ),
    );
  }
}

class Wish {
  final String name;
  bool selected = false;

  Wish(this.name);
}
