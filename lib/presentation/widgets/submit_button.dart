import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget submitButton(
  BuildContext context, {
  required String label,
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          label,
          style: context.textScheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: whiteTextColor,
          ),
        ),
      ),
    ),
  );
}

Widget outlinedButton(
  BuildContext context, {
  required String label,
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: isDarkMode(context) ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
        // border: Border.all(color: context.colorScheme.primary, width: 3),
      ),
      child: Center(
        child: Text(
          label,
          style: context.textScheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    ),
  );
}

Widget googleSignUpOrSignInButton(
  BuildContext context, {
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: isDarkMode(context) ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
        // border: Border.all(color: context.colorScheme.primary, width: 3),
      ),
      child: Center(
        child: Image.asset(
          googleIcon,
          scale: 15,
        ),
      ),
    ),
  );
}
