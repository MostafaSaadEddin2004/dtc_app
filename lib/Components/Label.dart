import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

Widget labelStyle({
  required String text,
}) =>
    Container(
      alignment: Alignment.center,
      height: 50,
      width: 280,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
          color: PrimaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(
                color: WhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
