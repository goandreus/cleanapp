import 'package:flutter/material.dart';

///This class defines aspects like colors used in every app
class ThemeApp {
  ThemeApp._();

  ///Main color used in every app
  static const Color appColor = Colors.lightGreen;

  ///Main Materialcolor used in every application
  static const MaterialColor appMaterialColor = MaterialColor(
    0xFFC2175B,
    <int, Color>{
      50: Colors.lightGreen,
      100: Colors.lightGreen,
      200: Colors.lightGreen,
      300: Colors.lightGreen,
      400: Colors.lightGreen,
      500: Colors.lightGreen,
      600: Colors.lightGreen,
      700: Colors.lightGreen,
      800: Colors.lightGreen,
      900: Colors.lightGreen,
    },
  );
}
