import 'package:aura/app/utils/utils.dart';
import 'package:aura/presentation/widgets/ui/build_signup_ui.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 22, right: 22, top: 128),
            child: buildSignUpUI(context),
          ),
        ),
      ),
    );
  }
}
