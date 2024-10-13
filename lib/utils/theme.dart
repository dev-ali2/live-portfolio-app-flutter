import 'package:flutter/material.dart';

class MyThemeData {
  static Color textColorForDark = Colors.white;
  static Color textColorForLight = Colors.black;
  static ThemeData myDarkTheme = ThemeData(
    colorSchemeSeed: Colors.cyan,
    canvasColor: Color.fromARGB(255, 32, 32, 32),
    brightness: Brightness.dark,
  );
  static ThemeData myLightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.cyan,
    canvasColor: Color.fromARGB(255, 230, 230, 230),
  );
}
