import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.blueGrey.shade300,    // main accent
    secondary: Colors.tealAccent.shade200, // for highlights
    tertiary: Colors.blueGrey.shade300,   // subtle secondary surfaces
    inversePrimary: Colors.blueGrey.shade900, // darkest
  ),
  scaffoldBackgroundColor: Colors.blueGrey.shade900,
);
