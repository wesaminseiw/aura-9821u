import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget textfield(
  BuildContext context, {
  required String hint,
  required String label,
  required TextInputType keyboardType,
  required TextEditingController controller,
  bool? isPassword,
  FocusNode? focusNode,
  bool? readOnly,
  void Function(String)? onChanged,
  void Function()? onTap,
}) {
  return Builder(
    builder: (context) {
      return TextField(
        readOnly: readOnly ?? false,
        focusNode: focusNode,
        controller: controller,
        style: context.headlineSmall!.copyWith(fontSize: 16),
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        obscuringCharacter: '●',
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          hintText: hint,
          hintStyle: context.headlineSmall!.copyWith(
            color: isDarkMode(context) ? whiteTextColor.withOpacity(0.4) : blackTextColor.withOpacity(0.6),
            fontSize: 16,
          ),
          floatingLabelStyle: context.headlineSmall!.copyWith(
            color: context.primary,
          ),
          labelText: label,
          labelStyle: context.headlineSmall!
              .copyWith(fontSize: 16, color: isDarkMode(context) ? whiteTextColor.withOpacity(0.6) : blackTextColor.withOpacity(0.6)),
          filled: true,
          fillColor: isDarkMode(context) ? darkBackgroundColor : lightBackgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: context.colorScheme.onSurface,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: context.colorScheme.primary, // Blue border for focused state
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: errorColor, // Red border if the field has an error
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: errorColor, // Slightly different error border
              width: 2,
            ),
          ),
        ),
      );
    },
  );
}
