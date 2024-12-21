import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:aura/presentation/widgets/circular_indicator.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/snackbar.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:aura/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

Widget buildSignInUI(BuildContext context) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthSignIn_Failure) {
        longTimeSnackBar(context, content: state.error);
      } else if (state is AuthSignIn_SuccessVerified) {
        shortTimeSnackBar(context, content: signinSuccessVerifiedSnackbar_Title);
        AppRouter.offFeed();
      } else if (state is AuthSignIn_SuccessNotVerified) {
        longTimeSnackBar(context, content: signinSuccessNotVerifiedSnackbar_Title);
        AppRouter.offVerifyEmail();
      }
    },
    builder: (context, state) {
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
            controller: emailController,
            hint: emailAddressTextField_Hint,
            label: emailAddressTextField_Label,
            keyboardType: TextInputType.emailAddress,
          ),
          height(18),
          textfield(
            context,
            controller: passwordController,
            hint: passwordTextField_Hint,
            label: passwordTextField_Label,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          height(18),
          state is AuthSignIn_Loading
              ? loading()
              : submitButton(
                  context,
                  label: signinButton_Label,
                  onTap: () async {
                    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      await context.read<AuthCubit>().signin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    } else {
                      shortTimeSnackBar(context, content: emptyFieldsSnackbarTitle);
                    }
                  },
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
                child: secondarySubmitButton(
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
                  onTap: () => AppRouter.offFeed(),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
