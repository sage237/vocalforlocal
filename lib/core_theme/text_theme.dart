import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;

  static final newTextTheme = TextTheme(
    //display theme
    displayLarge: GoogleFonts.quicksand(
        fontSize: 57, fontWeight: regular, color: Colors.black),
    displayMedium: GoogleFonts.quicksand(
        fontSize: 45, fontWeight: regular, color: Colors.black),
    displaySmall: GoogleFonts.quicksand(
        fontSize: 36, fontWeight: regular, color: Colors.black),

    //headline theme
    headlineLarge: GoogleFonts.quicksand(
        fontSize: 32, fontWeight: regular, color: Colors.black),
    headlineMedium: GoogleFonts.quicksand(
        fontSize: 28, fontWeight: regular, color: Colors.black),
    headlineSmall: GoogleFonts.quicksand(
        fontSize: 24, fontWeight: regular, color: Colors.black),

    //title theme
    titleLarge: GoogleFonts.quicksand(
        fontSize: 22, fontWeight: regular, color: Colors.black),
    titleMedium: GoogleFonts.quicksand(
        fontSize: 16, fontWeight: medium, color: Colors.black),
    titleSmall: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: medium, color: Colors.black),

    // label Theme
    labelLarge: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: medium, color: Colors.black),
    labelMedium: GoogleFonts.quicksand(
        fontSize: 12, fontWeight: medium, color: Colors.black),
    labelSmall: GoogleFonts.quicksand(
        fontSize: 11, fontWeight: medium, color: Colors.black),

    //body theme
    bodyLarge: GoogleFonts.quicksand(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
    bodyMedium: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    bodySmall: GoogleFonts.quicksand(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
  );
  static final newTextThemeDark = TextTheme(
    //display theme
    displayLarge: GoogleFonts.quicksand(
        fontSize: 57, fontWeight: regular, color: Colors.white),
    displayMedium: GoogleFonts.quicksand(
        fontSize: 45, fontWeight: regular, color: Colors.white),
    displaySmall: GoogleFonts.quicksand(
        fontSize: 36, fontWeight: regular, color: Colors.white),

    //headline theme
    headlineLarge: GoogleFonts.quicksand(
        fontSize: 32, fontWeight: regular, color: Colors.white),
    headlineMedium: GoogleFonts.quicksand(
        fontSize: 28, fontWeight: regular, color: Colors.white),
    headlineSmall: GoogleFonts.quicksand(
        fontSize: 24, fontWeight: regular, color: Colors.white),

    //title theme
    titleLarge: GoogleFonts.quicksand(
        fontSize: 22, fontWeight: regular, color: Colors.white),
    titleMedium: GoogleFonts.quicksand(
        fontSize: 16, fontWeight: medium, color: Colors.white),
    titleSmall: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: medium, color: Colors.white),

    // label Theme
    labelLarge: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: medium, color: Colors.white),
    labelMedium: GoogleFonts.quicksand(
        fontSize: 12, fontWeight: medium, color: Colors.white),
    labelSmall: GoogleFonts.quicksand(
        fontSize: 11, fontWeight: medium, color: Colors.black),

    //body theme
    bodyLarge: GoogleFonts.quicksand(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    bodyMedium: GoogleFonts.quicksand(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: GoogleFonts.quicksand(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  );

  // static final textTheme = TextTheme(
  //   headlineSmall: GoogleFonts.quicksand(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     color: AppColor.textblack,
  //   ),
  //   titleLarge: GoogleFonts.quicksand(
  //     fontSize: 24,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textblack,
  //   ),
  //   titleMedium: GoogleFonts.quicksand(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textblack,
  //   ),
  //   titleSmall: GoogleFonts.quicksand(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textblack,
  //   ),
  //   bodyMedium: GoogleFonts.quicksand(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textblack,
  //   ),
  //   bodySmall: GoogleFonts.quicksand(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w400,
  //     color: AppColor.textblack,
  //   ),
  //
  //   labelMedium: GoogleFonts.quicksand(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textblack,
  //   ),
  //
  //   // quicksand text with textprimary color
  //   displaySmall: GoogleFonts.quicksand(
  //     fontSize: 10,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textprimary,
  //   ),
  //   bodyLarge: GoogleFonts.quicksand(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w400,
  //     color: AppColor.textprimary,
  //   ),
  //
  //   labelSmall: GoogleFonts.quicksand(
  //     fontSize: 10,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textprimary,
  //   ),
  //
  //   displayMedium: GoogleFonts.quicksand(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textprimary,
  //   ),
  //   headlineMedium: GoogleFonts.quicksand(
  //     fontSize: 15,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textprimary,
  //   ),
  //   displayLarge: GoogleFonts.quicksand(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w500,
  //     color: AppColor.textprimary,
  //   ),
  //   labelLarge: GoogleFonts.quicksand(
  //     fontSize: 21,
  //     fontWeight: FontWeight.w700,
  //     color: AppColor.textprimary,
  //   ),
  // );
}
