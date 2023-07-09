import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Comparison_Screen.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/CustomCheckBoxList.dart';
import '../../../Constents/Colors.dart';
import 'Required_Documents.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({super.key});
  static String id = 'WishesPage';

  @override
  State<WishesPage> createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  bool isChecked = false;

  int checkedCount = 0;
  List<String> values = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلب الانتساب'),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: scientific.length,
              itemBuilder: (context, index) {
                String key = scientific.keys.elementAt(index);
                return CustomCheckBoxList(
                  onChange: (value) {
                    if (value) {
                      checkedCount++;
                      values.add(key);
                    } else {
                      checkedCount--;
                      values.remove(key);
                    }
                    setState(() {});
                    print(values);
                  },
                  textKey: key,
                  canCheck: checkedCount <= 5,
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            nextButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PersonalInformation()));
                },
                text: 'التالي'),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
