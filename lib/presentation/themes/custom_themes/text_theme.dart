import '../../styles/colors.dart';
import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
  //* display style
  displayLarge: const TextStyle().copyWith(fontSize: 54, fontWeight: FontWeight.w800, color: blackTextColor),
  displayMedium: const TextStyle().copyWith(fontSize: 42, fontWeight: FontWeight.bold, color: blackTextColor),
  displaySmall: const TextStyle().copyWith(fontSize: 36, fontWeight: FontWeight.w600, color: blackTextColor),

  //* headline style
  headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: blackTextColor),
  headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: blackTextColor),
  headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: blackTextColor),

  //* label style
  titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: blackTextColor),
  titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: blackTextColor),
  titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: blackTextColor),

  //* body style
  bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: blackTextColor),
  bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: blackTextColor),
  bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: blackTextColor.withOpacity(0.5)),

  //* body style
  labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: blackTextColor),
  labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: blackTextColor.withOpacity(0.5)),
);
TextTheme darkTextTheme = TextTheme(
  //* display style
  displayLarge: const TextStyle().copyWith(fontSize: 54, fontWeight: FontWeight.w800, color: whiteTextColor),
  displayMedium: const TextStyle().copyWith(fontSize: 42, fontWeight: FontWeight.bold, color: whiteTextColor),
  displaySmall: const TextStyle().copyWith(fontSize: 36, fontWeight: FontWeight.w600, color: whiteTextColor),

  //* headline style
  headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: whiteTextColor),
  headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: whiteTextColor),
  headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: whiteTextColor),

  //* label style
  titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: whiteTextColor),
  titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: whiteTextColor),
  titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: whiteTextColor),

  //* body style
  bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: whiteTextColor),
  bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: whiteTextColor),
  bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: whiteTextColor.withOpacity(0.5)),

  //* body style
  labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: whiteTextColor),
  labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: whiteTextColor.withOpacity(0.5)),
);
