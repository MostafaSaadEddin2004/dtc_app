import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required String text,
  required Color backgroundColor,
  required double fontSize,
  required void Function() onTap,
  void Function()? onDoubleTap,
}) =>
    InkWell(
      radius: 20,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              color: WhiteColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget coloredNextButton(
        {required String text,
        required void Function() onTap,
        required Color buttonColor}) =>
    InkWell(
      radius: 20,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: WhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget nextButton(
        {required String text,
        required void Function() onTap,
        void Function()? onDoubleTap}) =>
    InkWell(
      radius: 20,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: WhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
