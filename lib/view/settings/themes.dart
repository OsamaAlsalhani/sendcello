import 'package:flutter/material.dart';
import 'package:supercellostore/constance.dart';

class ThemesCus {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
        elevation: 0, iconTheme: IconThemeData(color: primaryColor)),
    iconTheme: const IconThemeData(color: primaryColor, opacity: 0.8),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade800,
      selectedIconTheme: const IconThemeData(color: primaryColor),
      unselectedIconTheme: const IconThemeData(color: primaryColor),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    iconTheme: const IconThemeData(color: primaryColor),
  );
}
