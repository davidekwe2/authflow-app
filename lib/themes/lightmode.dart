import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.indigo.shade400,      // main accent
    secondary: Colors.indigo.shade100,    // subtle highlight
    tertiary: Colors.grey.shade800,       // for text/icons
    inversePrimary: Colors.white,         // cards/surfaces
  ),
  scaffoldBackgroundColor: Colors.grey.shade100, // clean light background
);
