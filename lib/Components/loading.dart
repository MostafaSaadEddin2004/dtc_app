import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WhiteColor,
      child: Center(
        child: const CircularProgressIndicator(color: PrimaryColor),
      ),
    );
  }
}
