import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Comparison_Screen.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/CustomCheckBoxList.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';
import 'Required_Documents.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({super.key});
  static String id = 'WishesPage';

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
  List<String> selectedWishes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلب الانتساب'),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              labelStyle(text: 'إختر ستة رغبات'),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 278,
            child: ListView.builder(
                itemCount: wishesList.length,
                itemBuilder: (context, index) {
                  // String key = scientific.keys.elementAt(index);
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      Text('${wishesList[index]}'),
                      const Spacer(
                        flex: 1,
                      ),
                      IconButton(
                          onPressed: () {
                            if (checkedCount <= 5) {
                              checkedCount++;
                              selectedWishes.add(wishesList[index]);
                              wishesList.remove(wishesList[index]);
                              setState(() {});
                            } else {
                              print('stop select');
                            }
                          },
                          icon: const Icon(
                            Icons.add_circle_rounded,
                            color: PrimaryColor,
                            size: 30,
                          )),
                    ]),
                  );

                  // CustomCheckBoxList(
                  //   onChange: (value) {
                  //     if (value) {
                  //       checkedCount++;
                  //       selectedWishes.add(key);
                  //       setState(() {});
                  //     } else {
                  //       checkedCount--;
                  //       selectedWishes.remove(key);
                  //       setState(() {});
                  //     }
                  //     print(selectedWishes);
                  //   },
                  //   textKey: key,
                  //   canCheck: checkedCount <= 5,
                  // );
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
                itemCount: selectedWishes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      Text('${index + 1}-  ${selectedWishes[index]}'),
                      const Spacer(
                        flex: 1,
                      ),
                      IconButton(
                          onPressed: () {
                            checkedCount--;
                            wishesList.add(selectedWishes[index]);
                            selectedWishes.remove(selectedWishes[index]);
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
                          builder: (context) => const PersonalInformation()));
                    } else {
                      print('you cannot navigate');
                    }
                  },
                  text: 'التالي'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
