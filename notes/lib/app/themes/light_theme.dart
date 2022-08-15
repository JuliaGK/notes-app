import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF4027FF),
      titleTextStyle: GoogleFonts.openSans(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4027FF),
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: const Color(0xFF4027FF),
        textStyle: GoogleFonts.roboto(
          fontSize: 22,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.0),
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 1.3,
        ),
      ),
      labelStyle: const TextStyle(color: Colors.black54),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.0),
        borderSide: const BorderSide(
          color: Colors.black54,
          width: 1.3,
        ),
      ),
    ),
  );
}