import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String? Function(String? text) validator,
  String? labelText,
  String? hint,
  bool? obscure,
  required double radius,
  required double padding,
  TextInputType? keyboardType,
  IconData? prefix,
  IconButton? suffix,
  required void Function(String data) onChanged,
}) =>
    Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscure!,
        enabled: true,
        cursorColor: GreyColor,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIconColor: GreyColor,
          suffixIconColor: GreyColor,
          floatingLabelStyle: const TextStyle(
            color: BlackColor,
          ),
          hintText: hint,
          label: Text(labelText!),
          labelStyle: const TextStyle(color: GreyColor, fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: const BorderSide(color: Colors.transparent)),
          prefixIcon: Icon(prefix),
          suffixIcon: suffix,
          contentPadding: EdgeInsets.all(padding),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: GreyColor),
          ),
        ),
      ),
    );

Widget registrationInfoTextField(
        {required TextEditingController controller,
        required String? Function(String? text) validator,
        required double radius,
        required TextInputType? keyboardType,
        Function(String data)? onChanged,
        IconData? prefix,
        int? maxLines}) =>
    Container(
      child: TextFormField(
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        enabled: true,
        cursorColor: GreyColor,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          // floatingLabelStyle: const TextStyle(
          //   color: BlackColor,
          // ),
          hintText: 'أكتب هنا...',
          // label: Text(label!),
          // labelStyle: const TextStyle(color: GreyColor, fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: const BorderSide(color: Colors.transparent)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: GreyColor,
            ),
          ),
        ),
      ),
    );

class UploadFileTextFormField extends StatelessWidget {
  const UploadFileTextFormField(
      {super.key,
      this.fileTypeText,
      required this.controller,
      required this.onPressedUploadIcon,
      required this.validator});
  final String? fileTypeText;
  final TextEditingController controller;
  final Function() onPressedUploadIcon;
  final String Function(String? text) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (data) {},
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.none,
        enabled: true,
        cursorColor: GreyColor,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          suffixIconColor: BlackColor,
          hintText: 'أنقر على الرمز لتحميل $fileTypeText',
          hintStyle: const TextStyle(color: GreyColor, fontSize: 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.upload),
            onPressed: onPressedUploadIcon,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: GreyColor),
          ),
        ));
  }
}
