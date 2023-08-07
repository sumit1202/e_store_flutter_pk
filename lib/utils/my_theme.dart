import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  final lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lato().fontFamily,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.greenAccent),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
  );
  final darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lato().fontFamily,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.green),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  );
}
