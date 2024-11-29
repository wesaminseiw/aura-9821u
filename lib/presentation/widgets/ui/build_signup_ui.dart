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
final TextEditingController usernameController = TextEditingController();
final TextEditingController fullNameController = TextEditingController();

Widget buildSignUpUI(BuildContext context) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthSignUp_Failure) {
        longTimeSnackBar(context, content: state.error);
      } else if (state is AuthSignUp_Success) {
        longTimeSnackBar(context, content: signupSuccessSnackbar_Title);
        AppRouter.offVerifyEmail();
      }
    },
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isDarkMode(context) ? logoLightNoBg : logoDarkNoBg,
            width: 120,
            height: 120,
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
          height(18),
          Row(
            children: [
              Expanded(
                child: textfield(
                  context,
                  controller: fullNameController,
                  hint: fullNameTextField_Hint,
                  label: fullNameTextField_Label,
                  keyboardType: TextInputType.name,
                ),
              ),
              width(16),
              Expanded(
                child: textfield(
                  context,
                  controller: usernameController,
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
            controller: emailController,
            hint: emailAddressTextField_Hint,
            label: emailAddressTextField_Label,
            keyboardType: TextInputType.emailAddress,
          ),
          height(12),
          textfield(
            context,
            controller: passwordController,
            hint: passwordTextField_Hint,
            label: passwordTextField_Label,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          height(10),
          Text(
            signupWarningText,
            style: context.headlineSmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.grey[600]!,
            ),
            textAlign: TextAlign.center,
          ),
          height(18),
          state is AuthSignUp_Loading
              ? loading()
              : submitButton(
                  context,
                  label: signupButton_Label,
                  onTap: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        usernameController.text.isNotEmpty &&
                        fullNameController.text.isNotEmpty) {
                      await context.read<AuthCubit>().signup(
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                            fullName: fullNameController.text,
                          );
                    } else {
                      shortTimeSnackBar(context, content: authCubit_EmptyFieldsSnackbarTitle);
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
    },
  );
}
