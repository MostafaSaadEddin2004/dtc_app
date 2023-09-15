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
