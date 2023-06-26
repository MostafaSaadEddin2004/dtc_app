import 'package:dtc_app/Constents/Colors.dart';
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

PreferredSizeWidget coursePageAppBar({required String title}) => AppBar(
      backgroundColor: PrimaryColor,
      title: Text(title),
    );
