import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:get_storage/get_storage.dart';

class ThemesCus {
  final _getstorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(),
    dividerColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
        color: Colors.grey.shade800,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor)),
    iconTheme: const IconThemeData(color: primaryColor, opacity: 0.8),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade800,
      selectedIconTheme: const IconThemeData(color: primaryColor),
      unselectedIconTheme: const IconThemeData(color: primaryColor),
    ),
  );

  final lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(),
    dividerColor: Colors.white54,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    iconTheme: const IconThemeData(color: primaryColor),
  );

  void saveThemeData(bool isDarkMode) {
    _getstorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSaveDarkMode() {
    return _getstorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSaveDarkMode());
  }
}
