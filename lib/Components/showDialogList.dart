import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

class ShowDialogList extends StatefulWidget {
  const ShowDialogList({super.key, required this.value, required this.child});
  final String value;
  final Widget child;

  @override
  State<ShowDialogList> createState() => _ShowDialogListState();
}

class _ShowDialogListState extends State<ShowDialogList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(color: GreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: GreyColor, offset: Offset(1, 1)),
          ]),
      child: Row(
        children: [
          Text(widget.value == '' ? 'اضغط للإختيار...' : widget.value,
              overflow: TextOverflow.ellipsis),
          const Spacer(
            flex: 1,
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        border: Border.all(color: GreyColor, width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 200),
                      child: widget.child),
                );
              },
              icon: Icon(
                Icons.add_circle_rounded,
                color: PrimaryColor,
              ))
        ],
      ),
    );
  }
}
