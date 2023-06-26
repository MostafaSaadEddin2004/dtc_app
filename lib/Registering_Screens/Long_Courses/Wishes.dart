import 'package:dtc_app/Registering_Screens/Long_Courses/Comparison_Screen.dart';
import 'package:dtc_app/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Constents/Colors.dart';
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
  void handleCheckbox(bool isChecked) {
    setState(() {});
  }

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
                return CheckboxListTile(
                    value: isChecked,
                    title: Text(key),
                    activeColor: PrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        if (isChecked) {
                          if (checkedCount < 6) {
                            checkedCount++;
                            isChecked = value!;
                          }
                        } else {
                          if (checkedCount > 6) {
                            checkedCount--;
                            isChecked = value!;
                          }
                        }
                      });
                    });
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
