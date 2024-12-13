import 'dart:developer';

import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:aura/logic/cubits/customization_cubit/customization_cubit.dart';
import 'package:aura/presentation/widgets/circular_indicator.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/snackbar.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildVerifyEmailUI(BuildContext context, String email) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) async {
      if (state is AuthCheckVerification_NotVerified) {
        shortTimeSnackBar(context, content: notVerifiedYet);
      } else if (state is AuthCheckVerification_Verified) {
        context.read<CustomizationCubit>().checkIfCustomizationDataExists();
      } else if (state is CustomizationExistCheck_Exists) {
        AppRouter.offHome();
      } else if (state is CustomizationExistCheck_NotExisting) {
        AppRouter.offCustomization();
      }
    },
    builder: (context, state) {
      return Padding(
        padding: horizontalPadding,
        child: ListView(
          children: [
            Image.asset(
              verifyEmailImage,
              scale: isDarkMode(context) ? 10 : 7,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.bodyLarge, // Default style for the text
                children: [
                  TextSpan(
                    text: verifyEmailSubtitle_Part1,
                    style: context.bodyLarge, // Apply style or change if needed
                  ),
                  TextSpan(
                    text: ' $email ', // Email part
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, // Example customization for the email
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: '$verifyEmailSubtitle_Part2 ',
                    style: context.bodyLarge, // Apply style or change if needed
                  ),
                  TextSpan(
                    text: verifyEmailSubtitle_Part3,
                    style: context.bodyLarge, // Apply style or change if needed
                  ),
                ],
              ),
            ),
            height(48),
            state is AuthCheckVerification_Loading
                ? loading()
                : submitButton(
                    context,
                    label: checkVerificationButton_Label,
                    onTap: () async {
                      log(context.read<AuthCubit>().state.toString());
                      context.read<AuthCubit>().getEmail();
                      log(context.read<AuthCubit>().state.toString());
                      await context.read<AuthCubit>().checkEmailVerification();
                    },
                  ),
            height(16),
            secondarySubmitButton(
              context,
              label: restart,
              onTap: () async {
                AppRouter.offSignIn();
              },
            ),
            // state is AuthDeleteUser_Loading
            //     ? loading()
            //     : secondarySubmitButton(
            //         context,
            //         label: deleteAccountButton_Label,
            //         onTap: () async {
            //           await context.read<AuthCubit>().deleteUser();
            //           AppRouter.offSignIn();
            //         },
            //       ),
          ],
        ),
      );
    },
  );
}
