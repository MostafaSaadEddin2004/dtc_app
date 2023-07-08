import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'تم تسجيل طلب $title بنجاح',
        textAlign: TextAlign.center,
      ),
      icon: const Icon(
        Icons.check_circle,
        size: 30,
      ),
      iconColor: PrimaryColor,
      alignment: Alignment.center,
      actions: [Center(child: nextButton(text: 'تم', onTap: onPressed))],
    );
  }
}

class EditingPrivacyDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;

  const EditingPrivacyDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('تم'),
        ),
      ],
    );
  }
}
