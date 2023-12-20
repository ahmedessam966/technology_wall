import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme extends ChangeNotifier {
  AppTheme();

  static const Color darkest = Color(0xaa071923);
  static const Color second = Color(0XAA7C9CC1);
  static const Color hint = Color(0XAAF7B318);
  static const Color prohibit = Color(0XAAF85118);

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xaa071923).withOpacity(1),
        scrollbarTheme: const ScrollbarThemeData(thumbColor: MaterialStatePropertyAll(Colors.grey)),
        textTheme: TextTheme(
          //English Fonts
          headlineLarge: GoogleFonts.lexend(fontSize: 18.sp),
          headlineMedium: GoogleFonts.lexend(fontSize: 16.sp),
          headlineSmall: GoogleFonts.lexend(fontSize: 14.sp),
          bodyLarge: GoogleFonts.lexend(fontSize: 12.sp),
          bodyMedium: GoogleFonts.lexend(fontSize: 10.sp),
          bodySmall: GoogleFonts.lexend(fontSize: 8.sp),

          //Arabic Fonts
          titleLarge: GoogleFonts.notoKufiArabic(fontSize: 18.sp),
          titleMedium: GoogleFonts.notoKufiArabic(fontSize: 16.sp),
          titleSmall: GoogleFonts.notoKufiArabic(fontSize: 14.sp),
          displayLarge: GoogleFonts.notoKufiArabic(fontSize: 12.sp),
          displayMedium: GoogleFonts.notoKufiArabic(fontSize: 10.sp),
          displaySmall: GoogleFonts.notoKufiArabic(fontSize: 8.sp),
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
