import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/snackbar.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: Fix the design of the verify screen
// TODO: Not navigating to home after verified
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCheckVerification_NotVerified) {
          shortTimeSnackBar(context, content: notVerifiedYet);
        } else if (state is AuthCheckVerification_Verified) {
          AppRouter.offHome();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 120,
            title: Text(
              verify,
              style: context.textScheme.displayMedium,
            ),
          ),
          body: Padding(
            padding: horizontalPadding,
            child: ListView(
              children: [
                Image.asset(
                  verifyEmailImage,
                  scale: isDarkMode(context) ? 10 : 7,
                ),
                state is AuthGetEmail_Success
                    ? RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: context.bodyLarge, // Default style for the text
                          children: [
                            TextSpan(
                              text: verifyEmailSubtitle_Part1,
                              style: context.bodyLarge, // Apply style or change if needed
                            ),
                            TextSpan(
                              text: ' ${state.email} ', // Email part
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
                      )
                    : Text(
                        '$verifyEmailSubtitle_Part1 $you $verifyEmailSubtitle_Part2\n$verifyEmailSubtitle_Part3',
                        textAlign: TextAlign.center,
                        style: context.bodyLarge,
                      ),
                height(48),
                submitButton(
                  context,
                  label: checkVerificationButton_Label,
                  onTap: () {
                    context.read<AuthCubit>().checkEmailVerification();
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
          ),
        );
      },
    );
  }
}
