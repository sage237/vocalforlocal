import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        color: AppColor.white,
        shadowColor: Colors.black,
        elevation: 1,
        centerTitle: true),
    textTheme: AppTextTheme.newTextTheme,
    primaryColor: AppColor.primary,
  );
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme:
        const AppBarTheme(color: AppColor.white, shadowColor: Colors.black),
    primaryColor: Colors.white,
    textTheme: AppTextTheme.newTextThemeDark,
  );
}
