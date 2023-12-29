import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme extends ChangeNotifier {
  AppTheme();

  static const Color darkest = Color(0XAA130D33);
  static const Color second = Color(0XAA231955);
  static const Color third = Color(0XAA1F4690);
  static const Color hint = Color(0XAAE8AA42);
  static const Color light = Color(0XAAFFE5B4);
  static const Color prohibit = Color(0XAAF85118);

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: darkest.withOpacity(1),
        scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            thumbColor: const MaterialStatePropertyAll(Colors.grey),
            trackColor: MaterialStatePropertyAll(Colors.grey.shade300),
            trackBorderColor: const MaterialStatePropertyAll(Colors.black54),
            radius: const Radius.circular(1),
            trackVisibility: const MaterialStatePropertyAll(true)),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.grey.shade300),
        textTheme: TextTheme(
          //English Fonts
          headlineLarge: GoogleFonts.lexend(fontSize: 18.sp),
          headlineMedium: GoogleFonts.lexend(fontSize: 16.sp),
          headlineSmall: GoogleFonts.lexend(fontSize: 14.sp),
          bodyLarge: GoogleFonts.lexend(fontSize: 12.sp),
          bodyMedium: GoogleFonts.lexend(fontSize: 10.5.sp),
          bodySmall: GoogleFonts.lexend(fontSize: 8.sp),

          //Arabic Fonts
          titleLarge: GoogleFonts.notoKufiArabic(fontSize: 19.sp),
          titleMedium: GoogleFonts.notoKufiArabic(fontSize: 17.sp),
          titleSmall: GoogleFonts.notoKufiArabic(fontSize: 15.sp),
          displayLarge: GoogleFonts.notoKufiArabic(fontSize: 13.sp),
          displayMedium: GoogleFonts.notoKufiArabic(fontSize: 11.5.sp),
          displaySmall: GoogleFonts.notoKufiArabic(fontSize: 9.sp),

          //Dev Center Fonts
          labelLarge: GoogleFonts.spaceGrotesk(fontSize: 12.sp),
          labelMedium: GoogleFonts.spaceGrotesk(fontSize: 10.5.sp),
          labelSmall: GoogleFonts.spaceGrotesk(fontSize: 8.sp),
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
