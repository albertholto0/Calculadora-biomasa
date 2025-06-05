import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 67, 160, 71),
  surface: const Color.fromARGB(255, 255, 255, 255),
  primary: const Color.fromARGB(255, 56, 142, 60),
  secondary: const Color.fromARGB(255, 129, 199, 132),
);

final appTextTheme = GoogleFonts.nunitoTextTheme().copyWith(
  bodyMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16.0),
  bodyLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20.0),
  titleSmall: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18.0),
  titleMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22.0),
  titleLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 28.0),
);

final appTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: appColorScheme.surface,
  colorScheme: appColorScheme,
  textTheme: appTextTheme,
);
