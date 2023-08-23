import 'package:dtc_app/Constants/Colors.dart';
import 'package:flutter/material.dart';

String? RegistrationValidator(
    {required value,
    required String fieldName,
    required int maxLength,
    required int minLength}) {
  if (value.isEmpty) {
    return '$fieldName is required';
  } else if (value.length < minLength) {
    return '$fieldName must be $minLength character at least';
  } else if (value.length > maxLength) {
    return '$fieldName must be $maxLength character at least';
  }
}

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

Widget registrationInfoTextField({
  required TextEditingController controller,
  required String? Function(String? text) validator,
  required double radius,
  required TextInputType? keyboardType,
  IconData? prefix,
  int? maxLines
}) =>
    Container(
      child: TextFormField(
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: GreyColor,
            ),
          ),
        ),
      ),
    );
