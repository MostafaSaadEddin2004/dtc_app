import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({
  required String title,
  IconData? leadingIcon,
}) =>
    AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: WhiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(leadingIcon),
        ]);

PreferredSizeWidget AppBarr({
  String? title,
  IconData? leadingIcon,
  required bool botom,
  required List<Widget> tabs,
}) =>
    AppBar(
        backgroundColor: PrimaryColor,
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'IT / IT',
              style: TextStyle(
                  color: WhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
        bottom: botom == true ? TabBar(tabs: tabs) : null);

PreferredSizeWidget coursePageAppBar({required String title}) => AppBar(
      backgroundColor: PrimaryColor,
      title: Text(title),
    );

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({super.key, required this.text, required this.wantBottom});
  final Widget text;
  final bool wantBottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryColor,
      bottom: wantBottom == true
          ? const TabBar(
              indicatorColor: WhiteColor,
              unselectedLabelStyle: TextStyle(fontSize: 16),
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  child: Text('الدورات'),
                ),
                Tab(
                  child: Text('منشورات القسم'),
                ),
              ],
            )
          : null,
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 30,
          decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text.toString(),
            style: TextStyle(
                color: WhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}
