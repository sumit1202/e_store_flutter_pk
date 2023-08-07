import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  final lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lato().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
  );
  final darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lato().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
  );
}
