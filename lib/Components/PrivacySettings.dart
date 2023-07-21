import 'package:dtc_app/Constents/Colors.dart';
import 'package:dtc_app/Constents/TextStyle.dart';
import 'package:flutter/material.dart';

Widget privacyEditing({
  required IconData icon,
  required String label,
  required String value,
  required void Function() onPressedIconButton,
}) =>
    Container(
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(width: 0.5, color: GreyColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: GreyColor, blurRadius: 2, offset: Offset(2, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 15, bottom: 5),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
           Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelFont(text: label),
                      bodyText(text: value),
                    ],
                  ),
               
            const SizedBox(
              width: 10,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                  onPressed: onPressedIconButton, icon: Icon(Icons.edit)),
            )
          ],
        ),
      ),
    );

Widget studentRequests({
  required IconData prefixIcon,
  Color? prefixIconColor,
  required IconData suffixIcon,
  Color? suffixIconColor,
  required double suffixIconSize,
  required String label,
  Color? labelColor,
  required void Function() onPressedIconButton,
}) =>
    Container(
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: GreyColor, blurRadius: 2, offset: Offset(2, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              prefixIcon,
              color: prefixIconColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                  color: labelColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: onPressedIconButton,
                  icon: Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: suffixIconSize,
                  )),
            )
          ],
        ),
      ),
    );
