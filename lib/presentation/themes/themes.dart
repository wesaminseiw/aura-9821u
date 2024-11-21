import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../themes/custom_themes/text_theme.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: lightBackgroundColor,
          statusBarColor: Colors.transparent,
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
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: darkBackgroundColor,
          statusBarColor: Colors.transparent,
        ),
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      textTheme: darkTextTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );
