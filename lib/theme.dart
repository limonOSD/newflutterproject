import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
        backgroundColor: Colors.grey.shade200),
  ),
);
