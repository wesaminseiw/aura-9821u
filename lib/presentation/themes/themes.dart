import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../themes/custom_themes/text_theme.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: lightBackgroundColor,
        secondary: lightSecondaryColor,
        onSecondary: lightBackgroundColor,
        error: Colors.red[900]!,
        onError: lightBackgroundColor,
        surface: lightBackgroundColor,
        onSurface: lightSecondaryColor,
      ),
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
          color: blackTextColor,
        ),
      ),
      scaffoldBackgroundColor: lightBackgroundColor,
      textTheme: lightTextTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );

ThemeData darkTheme() => ThemeData(
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primaryColor,
        onPrimary: lightBackgroundColor,
        secondary: lightBackgroundColor,
        onSecondary: lightSecondaryColor,
        error: Colors.red[900]!,
        onError: lightBackgroundColor,
        surface: lightSecondaryColor,
        onSurface: lightBackgroundColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
          color: whiteTextColor,
        ),
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      textTheme: darkTextTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );
