import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color textColor = const Color(0xff080c10);
  static Color primary = const Color(0xff01669b);
  static Color success = const Color(0xff019b6d);
  static Color error = const Color(0xff800126);
  static ThemeData lightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        labelLarge: GoogleFonts.urbanist(color: textColor),
        labelMedium: GoogleFonts.urbanist(color: textColor),
        labelSmall: GoogleFonts.urbanist(color: textColor),
        displayLarge: GoogleFonts.urbanist(color: textColor),
        displayMedium: GoogleFonts.urbanist(color: textColor),
        displaySmall: GoogleFonts.urbanist(color: textColor),
        bodyLarge: GoogleFonts.urbanist(color: textColor),
        bodyMedium: GoogleFonts.urbanist(color: textColor),
        bodySmall: GoogleFonts.urbanist(color: textColor),
        titleLarge: GoogleFonts.urbanist(color: textColor),
        titleMedium: GoogleFonts.urbanist(color: textColor),
        titleSmall: GoogleFonts.urbanist(color: textColor),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      appBarTheme: appBarTheme());

  static AppBarTheme appBarTheme() => AppBarTheme(
        color: primary,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      );
}
