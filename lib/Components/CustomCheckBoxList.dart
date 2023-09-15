import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class CustomCheckBoxList extends StatefulWidget {
  const CustomCheckBoxList(
      {super.key,
      required this.onChange,
      required this.textKey,
      required this.canCheck,
      this.isChecked = false});

  final Function(bool value) onChange;
  final bool canCheck;
  final String textKey;
  final bool isChecked;
  @override
  State<CustomCheckBoxList> createState() => _CustomCheckBoxListState();
}

class _CustomCheckBoxListState extends State<CustomCheckBoxList> {
  late bool isChecked = widget.isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: GreyColor),
          borderRadius: BorderRadius.circular(5),
          color: WhiteColor,
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: GreyColor, offset: Offset(1, 1))
          ]),
      child: CheckboxListTile(
          value: isChecked,
          key: UniqueKey(),
          title: Text(widget.textKey),
          activeColor: PrimaryColor,
          onChanged: (value) {
            setState(() {
              if (widget.canCheck || isChecked) {
                isChecked = !isChecked;
                widget.onChange(isChecked);
              }
            });
          }),
    );
  }
}
