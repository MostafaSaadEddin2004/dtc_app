import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

Widget notes({
  required String noteTitle,
  required String noteClassification,
  required String notetext,
}) =>
    Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(width: 0.5, color: GreyColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: GreyColor, blurRadius: 2, offset: Offset(2, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                labelFont(text: noteTitle),
                const Spacer(
                  flex: 1,
                ),
                bodyText(text: noteClassification)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: GreyColor,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(child: bodyText(text: notetext)),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.delete),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
