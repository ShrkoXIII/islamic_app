import 'package:flutter/material.dart';

class AppTheme {
  static Color primarylight = Color(0xFFB7935F);
  static Color black = Color(0xFF242424);
  static Color wight = Colors.white;
  static ThemeData light_theme = ThemeData(
    primaryColor: primarylight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: black,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarylight,
      selectedItemColor: black,
      unselectedItemColor: wight,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
  static ThemeData dark_theme = ThemeData();
}
