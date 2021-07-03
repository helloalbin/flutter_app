import 'package:flutter/material.dart';

ThemeData appTheme() {
  final baseTheme = new ThemeData.light().copyWith(
    primaryColor: Colors.green[200],
    primaryColorDark: Colors.green[500],
    errorColor: Colors.red,
    backgroundColor: Colors.white,
    brightness: Brightness.dark,
    unselectedWidgetColor: Colors.black,
    hintColor: Colors.black,
  );
  return baseTheme;
}
