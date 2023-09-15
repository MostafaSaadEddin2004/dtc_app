import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constants/Colors.dart';
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
        'تم $title بنجاح',
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

Widget warningDialog({
  required String title,
  required String message,
  required VoidCallback onPressed,
}) =>
    AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('تم'),
        ),
      ],
    );

Widget towButtonWarningDialog({
  required String title,
  required String message,
  required VoidCallback onOkPressed,
  required String okButtontext,
  required VoidCallback onCancelPressed,
  required String cancelButtontext,
}) =>
    AlertDialog(title: Text(title), content: Text(message), actions: [
      coloredNextButton(
          text: okButtontext, onTap: onOkPressed, buttonColor: PrimaryColor),
      coloredNextButton(
          text: cancelButtontext,
          onTap: onCancelPressed,
          buttonColor: RedColor),
    ]);

Widget editingPrivacyDialog(
        {required String title,
        required TextEditingController controller,
        required String? Function(String? text) validator,
        String Function(String? text)? onChanged,
        required VoidCallback onOkPressed,
        required VoidCallback onCancelPressed,
        required TextInputType keyboardType,
        required IconData prefixIcon,
        Key? key,
        String? hint}) =>
    AlertDialog(
      title: Text(title),
      content: Form(
        key: key,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          enabled: true,
          cursorColor: GreyColor,
          decoration: InputDecoration(
            prefixIconColor: GreyColor,
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            prefixIcon: Icon(prefixIcon),
            contentPadding: const EdgeInsets.all(15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: GreyColor),
            ),
          ),
        ),
      ),
      actions: [
        Column(
          children: [
            Row(
              children: [
                coloredNextButton(
                    text: 'تعديل',
                    onTap: onOkPressed,
                    buttonColor: PrimaryColor),
                coloredNextButton(
                    text: 'إلغاء',
                    onTap: onCancelPressed,
                    buttonColor: RedColor),
              ],
            ),
          ],
        )
      ],
    );
