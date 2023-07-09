import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constents/Colors.dart';
import '../Students_Screens/Registering_Screens/Long_Courses/Comparison_Screen.dart';

class CustomCheckBoxList extends StatefulWidget {
  const CustomCheckBoxList(
      {super.key,
      required this.onChange,
      required this.textKey,
      required this.canCheck});

  final Function(bool value) onChange;
  final bool canCheck;
  final String textKey;
  @override
  State<CustomCheckBoxList> createState() => _CustomCheckBoxListState();
}

class _CustomCheckBoxListState extends State<CustomCheckBoxList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: isChecked,
        key: UniqueKey(),
        title: Text(widget.textKey),
        activeColor: PrimaryColor,
        onChanged: (value) {
          setState(() {
            print('Loai is the king');
            if (widget.canCheck || isChecked) {
              isChecked = !isChecked;
              widget.onChange(isChecked);
            }
          });
        });
  }
}
