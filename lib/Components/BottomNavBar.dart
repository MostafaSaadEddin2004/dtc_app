import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';

Widget browserBottomNavBar({
  required void Function(int index) onTap,
  required int currentIndex,
}) =>
    BottomNavigationBar(
      backgroundColor: PrimaryColor,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BlackColor,
      unselectedItemColor: WhiteColor,
      onTap: onTap,
      iconSize: 20,
      selectedIconTheme: const IconThemeData(size: 25),
      selectedFontSize: 14,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedFontSize: 12,
      unselectedIconTheme: const IconThemeData(size: 20),
      items: const [
        BottomNavigationBarItem(
          label: "الصفحة الرئيسية",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "الإشعارات",
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          label: "الدورات",
          icon: Icon(Icons.my_library_books),
        ),
      ],
    );

Widget studentBottomNavBar({
  required void Function(int index) onTap,
  required int currentIndex,
}) =>
    BottomNavigationBar(
      backgroundColor: PrimaryColor,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BlackColor,
      unselectedItemColor: WhiteColor,
      onTap: onTap,
      iconSize: 20,
      selectedIconTheme: const IconThemeData(size: 25),
      selectedFontSize: 14,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedFontSize: 12,
      unselectedIconTheme: const IconThemeData(size: 20),
      items: const [
        BottomNavigationBarItem(
          label: "الصفحة الرئيسية",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "الإشعارات",
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          label: "الملاحظات",
          icon: Icon(Icons.note_alt),
        ),
        BottomNavigationBarItem(
          label: "المنشورات",
          icon: Icon(Icons.my_library_books),
        ),
      ],
    );
