import 'package:flutter/material.dart';

class MyTheme {
////colors , dark mood , light mode
  static Color blackColor = Color(0xff242424);
  static Color primaryLight = Color(0xffB7935F);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //backgroundColor: primaryLight
        selectedItemColor: blackColor,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
}
