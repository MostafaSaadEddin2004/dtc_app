import 'package:flutter/material.dart';

Widget bodyText({
  required String text,
}) =>
    Text(
      softWrap: true,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      text,
      style: const TextStyle(fontSize: 14),
    );

Widget labelFont({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );

Widget titleText({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

Widget timeText({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
