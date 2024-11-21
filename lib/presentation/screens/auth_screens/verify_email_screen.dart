import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
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
            Text(
              '$verifyEmailSubtitle_Part1 %EMAIL% $verifyEmailSubtitle_Part2\n$verifyEmailSubtitle_Part3',
              textAlign: TextAlign.center,
              style: context.bodyLarge,
            ),
            height(48),
            submitButton(
              context,
              label: checkVerificationButton_Label,
              onTap: () => AppRouter.offHome(),
            ),
            height(16),
            outlinedButton(
              context,
              label: deleteAccountButton_Label,
              onTap: () => AppRouter.offSignIn(),
            ),
          ],
        ),
      ),
    );
  }
}
