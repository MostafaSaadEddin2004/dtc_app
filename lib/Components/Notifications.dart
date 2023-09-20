import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../Constants/TextStyle.dart';

Widget notificationsBubble({
  required String notificationBody,
  required String notificationTitle,
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
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            child: CircleAvatar(
                minRadius: 30,
                maxRadius: 30,
                backgroundColor: PrimaryColor,
                child: Image.asset(
                  'assets/images/white_logo.png',
                  fit: BoxFit.cover,
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
                  titleText(text: notificationTitle),
                  ReadMoreText(
                    notificationBody,
                    moreStyle: TextStyle(
                        color: PrimaryColor, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(
                        color: PrimaryColor, fontWeight: FontWeight.bold),
                    trimCollapsedText: ' عرض المزيد ',
                    trimExpandedText: ' عرض أقل ',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
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
