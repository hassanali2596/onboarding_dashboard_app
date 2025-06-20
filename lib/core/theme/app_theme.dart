import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColorsLight().primary,
    scaffoldBackgroundColor: AppColorsLight().background,
    cardColor: AppColorsLight().cardBackground,
    indicatorColor: AppColorsLight().primary,
    disabledColor: AppColorsLight().disabled,
    inputDecorationTheme:  InputDecorationTheme(
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)) ),
      enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColorsLight().borderColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColorsLight().primary, width: 1.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle:  TextStyle(color: AppColorsLight().hintColor, fontSize: 14),
    ),
    textSelectionTheme:  TextSelectionThemeData(
      cursorColor: AppColorsLight().primary,
    ),
    colorScheme: ColorScheme.light().copyWith(onPrimary: AppColorsLight().onPrimary),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColorsLight().textSecondary, fontSize: 14.0, fontWeight: FontWeight.w400),
      bodyMedium:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w500),
      bodyLarge:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 18.0, fontWeight: FontWeight.w600),
      headlineSmall:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineMedium:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineLarge:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 28.0, fontWeight: FontWeight.bold),
      labelSmall:  TextStyle(color: AppColorsLight().textSecondary, fontSize: 12.0, fontWeight: FontWeight.w400),
      labelMedium:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      labelLarge:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w600),
      titleSmall:  TextStyle(color: AppColorsLight().textSecondary, fontSize: 14.0, fontWeight: FontWeight.w400),
      titleMedium:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w500),
      titleLarge:  TextStyle(color: AppColorsLight().textPrimary, fontSize: 18.0, fontWeight: FontWeight.w600),
    ),
    appBarTheme:  AppBarTheme(backgroundColor: AppColorsLight().primary),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColorsDark().primary,
    scaffoldBackgroundColor: AppColorsDark().background,
    cardColor: AppColorsDark().cardBackground,
    indicatorColor: AppColorsDark().primary,
    disabledColor: AppColorsDark().disabled,
    inputDecorationTheme:  InputDecorationTheme(
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)) ),
      enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColorsDark().borderColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColorsDark().primary, width: 1.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle:  TextStyle(color: AppColorsDark().hintColor, fontSize: 14),
    ),
    textSelectionTheme:  TextSelectionThemeData(
      cursorColor: AppColorsDark().primary,
    ),
    colorScheme: ColorScheme.dark().copyWith(onPrimary: AppColorsDark().onPrimary),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColorsDark().textSecondary, fontSize: 14.0, fontWeight: FontWeight.w400),
      bodyMedium:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w500),
      bodyLarge:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 18.0, fontWeight: FontWeight.w600),
      headlineSmall:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineMedium:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineLarge:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 28.0, fontWeight: FontWeight.bold),
      labelSmall:  TextStyle(color: AppColorsDark().textSecondary, fontSize: 12.0, fontWeight: FontWeight.w400),
      labelMedium:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      labelLarge:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w600),
      titleSmall:  TextStyle(color: AppColorsDark().textSecondary, fontSize: 14.0, fontWeight: FontWeight.w400),
      titleMedium:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 16.0, fontWeight: FontWeight.w500),
      titleLarge:  TextStyle(color: AppColorsDark().textPrimary, fontSize: 18.0, fontWeight: FontWeight.w600),
    ),
    appBarTheme:  AppBarTheme(backgroundColor: AppColorsDark().primary),
  );
}
