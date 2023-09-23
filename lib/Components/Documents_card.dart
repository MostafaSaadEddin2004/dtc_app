import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Constants/Colors.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard(
      {super.key,
      required this.title,
      required this.onUploadPressed,
      required this.onShowPressed});
  final String title;
  final Function() onUploadPressed;
  final Function() onShowPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        CircleAvatar(
          maxRadius: 16,
          backgroundColor: GreyColor,
          child: CircleAvatar(
              maxRadius: 15,
              backgroundColor: WhiteColor,
              child: GestureDetector(
                onTap: onShowPressed,
                child: Icon(
                  Icons.visibility,
                  size: 20,
                  color: GreyColor,
                ),
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          maxRadius: 16,
          backgroundColor: GreyColor,
          child: CircleAvatar(
              maxRadius: 15,
              backgroundColor: WhiteColor,
              child: GestureDetector(
                onTap: onUploadPressed,
                child: Icon(
                  FontAwesomeIcons.image,
                  size: 20,
                  color: GreyColor,
                ),
              )),
        ),
      ]),
    );
  }
}
