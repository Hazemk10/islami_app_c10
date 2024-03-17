import 'package:flutter/material.dart';

class MyTheme {
////colors , dark mood , light mode
  static Color blackColor = Color(0xff242424);
  static Color primaryLight = Color(0xffB7935F);
  static Color whiteColor = Color(0xffffffff);
  static Color secondaryColor = Color(0xffccad77);
  static Color primaryDark = Color(0xff141A2E);
  static Color yellowColor = Color(0xffFACC1D);



  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme:IconThemeData(
          color: Colors.black
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //backgroundColor: primaryLight
        selectedItemColor: blackColor,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),

  );
  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme:IconThemeData(
            color: Colors.white
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //backgroundColor: primaryLight
      selectedItemColor: yellowColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
      titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,color: Colors.white),
    ),

  );
}
