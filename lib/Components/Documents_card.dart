import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

Widget documentsCard({
  required String title,
}) =>
    Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 15, top: 10, right: 5, bottom: 10),
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(width: 0.5, color: GreyColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: GreyColor, blurRadius: 2, offset: Offset(2, 2))
          ]),
      child: Row(children: [
        Expanded(
            child: Text(
          title,
          maxLines: 2,
        )),
        const SizedBox(
          width: 15,
        ),
        const VerticalDivider(
          color: GreyColor,
          thickness: 0.5,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt_rounded),
          color: GreyColor,
        ),
      ]),
    );
