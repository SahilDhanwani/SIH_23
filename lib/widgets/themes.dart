import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color buttonColor = Colors.deepPurple;

  // ignore: prefer_typing_uninitialized_variables
  static var primaryColor;
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Set button color to deep purple
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.white, // Set text color for light theme
          background: Colors.white, // Set background color for light theme
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Set button color to deep purple
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.black, // Set text color for dark theme
          background: Colors.black, // Set background color for dark theme
        ),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}