import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends ChangeNotifier {
  AppTheme();

  static const Color darkest = Color(0xaa071923);
  static const Color second = Color(0XAAC8E0CA);
  static const Color hint = Color(0XAAF7B318);
  static const Color prohibit = Color(0XAAF85118);

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xaa071923).withOpacity(1),
        scrollbarTheme: const ScrollbarThemeData(
            trackColor: MaterialStatePropertyAll(Colors.white38),
            thumbColor: MaterialStatePropertyAll(Colors.white)),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.lexend(),
          titleMedium: GoogleFonts.lexend(),
          titleSmall: GoogleFonts.lexend(),
          displayLarge: GoogleFonts.lexend(),
          displayMedium: GoogleFonts.lexend(),
          displaySmall: GoogleFonts.lexend(),
          headlineLarge: GoogleFonts.lexend(),
          headlineMedium: GoogleFonts.lexend(),
          headlineSmall: GoogleFonts.lexend(),
          bodyLarge: GoogleFonts.lexend(),
          bodyMedium: GoogleFonts.lexend(),
          bodySmall: GoogleFonts.lexend(),
        ),
      );

  ///
  ///
  ThemeData get darkTheme => ThemeData(
        textTheme: TextTheme(
          titleLarge: GoogleFonts.lexend(),
          titleMedium: GoogleFonts.lexend(),
          titleSmall: GoogleFonts.lexend(),
          headlineLarge: GoogleFonts.lexend(),
          headlineMedium: GoogleFonts.lexend(),
          headlineSmall: GoogleFonts.lexend(),
          bodyLarge: GoogleFonts.lexend(),
          bodyMedium: GoogleFonts.lexend(),
          bodySmall: GoogleFonts.lexend(),
        ),
      );
}
