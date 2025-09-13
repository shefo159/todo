import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      titleSpacing: 30,
    ),
    cardColor: Colors.teal.shade100,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.tealAccent,
      foregroundColor: Colors.black,
      titleSpacing: 30,
    ),
    cardColor: Colors.teal.withOpacity(0.25),
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
  );
}