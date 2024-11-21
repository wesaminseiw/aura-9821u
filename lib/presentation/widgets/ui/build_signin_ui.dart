import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:aura/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';

Widget buildSignInUI(BuildContext context) {
  return Column(
    children: [
      Image.asset(
        isDarkMode(context) ? logoLightNoBg : logoDarkNoBg,
        width: 150,
        height: 150,
      ),
      height(64),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            signin,
            style: context.displayMedium,
          ),
          height(8),
          Row(
            children: [
              Text(
                signinSubtitle_Part1,
                style: context.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[600]!,
                ),
              ),
              Text(
                signinSubtitle_Part2,
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
      textfield(
        context,
        hint: emailAddressTextField_Hint,
        label: emailAddressTextField_Label,
        keyboardType: TextInputType.emailAddress,
      ),
      height(18),
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
        label: signinButton_Label,
        onTap: () => AppRouter.offHome(),
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
              label: signupButton_Label,
              onTap: () => AppRouter.offSignUp(),
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
