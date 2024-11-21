import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:aura/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';

Widget buildSignUpUI(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        isDarkMode(context) ? logoLightNoBg : logoDarkNoBg,
        width: 130,
        height: 130,
      ),
      height(48),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            signup,
            style: context.displayMedium,
          ),
          height(8),
          Row(
            children: [
              Text(
                signupSubtitle_Part1,
                style: context.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[600]!,
                ),
              ),
              Text(
                signupSubtitle_Part2,
                style: context.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
      height(24),
      Row(
        children: [
          Expanded(
            child: textfield(
              context,
              hint: fullNameTextField_Hint,
              label: fullNameTextField_Label,
              keyboardType: TextInputType.name,
            ),
          ),
          width(16),
          Expanded(
            child: textfield(
              context,
              hint: usernameTextField_Hint,
              label: usernameTextField_Label,
              keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
      height(12),
      textfield(
        context,
        hint: emailAddressTextField_Hint,
        label: emailAddressTextField_Label,
        keyboardType: TextInputType.emailAddress,
      ),
      height(12),
      textfield(
        context,
        hint: passwordTextField_Hint,
        label: passwordTextField_Label,
        keyboardType: TextInputType.visiblePassword,
        isPassword: true,
      ),
      height(18),
      submitButton(
        context,
        label: signupButton_Label,
        onTap: () => AppRouter.offVerifyEmail(),
      ),
      height(18),
      const Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              or,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      height(18),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: outlinedButton(
              context,
              label: signinButton_Label,
              onTap: () => AppRouter.offSignIn(),
            ),
          ),
          width(16),
          Expanded(
            flex: 1,
            child: googleSignUpOrSignInButton(
              context,
              onTap: () => AppRouter.offHome(),
            ),
          ),
        ],
      ),
    ],
  );
}
