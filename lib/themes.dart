import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 219, 219, 219),
    primarySwatch: Colors.lightGreen,
    fontFamily: 'Quicksand',
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    ),
    fontFamily: 'Quicksand',
  );
}
