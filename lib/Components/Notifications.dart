import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';
import '../Constents/TextStyle.dart';

Widget notificationsBubble({
  required String notificationText,
  required String time,
  required String notificationImage,
}) =>
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(width: 0.5, color: BlackColor),
              bottom: BorderSide(width: 0.5, color: BlackColor))),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10,right: 10),
            child: CircleAvatar(
                minRadius: 30,
                maxRadius: 30,
                backgroundColor: PrimaryColor,
                child: Icon(
                  Icons.person,
                  color: WhiteColor,
                  size: 45,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bodyText(text: notificationText),
                  const SizedBox(
                    height: 10,
                  ),
                  timeText(text: time),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
