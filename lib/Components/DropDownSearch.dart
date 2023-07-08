import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../Constents/Colors.dart';

Widget registrationDropDownSearch(
        {required void Function(String? data) onChange,
        required List<String> items,
        required String? Function(String? text) validator,
        required String hint,
        // required TextEditingController controller
        }) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      // decoration: BoxDecoration(
      //   color: WhiteColor,
      //   borderRadius: BorderRadius.circular(2),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: GreyColor,
      //       blurRadius: 2,
      //       offset: Offset(2, 2), // Shadow position
      //     ),
      //   ],
      // ),
      child: DropdownSearch<String>(
        validator: validator,
        onChanged: onChange,
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: PrimaryColor)),
                hintText: '',
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: GreyColor, width: 0.5),
                    borderRadius: BorderRadius.circular(2)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: GreyColor, width: 0.5),
                    borderRadius: BorderRadius.circular(2)))),
        dropdownButtonProps: const DropdownButtonProps(
            icon: Icon(
          Icons.arrow_drop_down_circle,
          color: PrimaryColor,
        )),
        items: items,
        popupProps: PopupPropsMultiSelection.menu(
          fit: FlexFit.loose,
          menuProps: MenuProps(
              shape: BeveledRectangleBorder(
                  side: const BorderSide(width: 0.5, color: PrimaryColor),
                  borderRadius: BorderRadius.circular(2))),
        ),
      ),
    );
