import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Check the user state and emit the appropriate AuthState
    context.read<AuthCubit>().checkUserState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode(context) ? darkBackgroundColor : lightBackgroundColor,
      body: Stack(
        children: [
          // Center the logo
          Center(
            child: Image.asset(
              isDarkMode(context) ? logoLightNoBg : logoDarkNoBg,
              width: 120, // Adjust as needed
              height: 120,
            ),
          ),
          // Bottom text
          Positioned(
            bottom: 32.0, // Distance from the bottom edge
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  aura,
                  textAlign: TextAlign.center,
                  style: context.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4), // Small space between the lines
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      byWes,
                      style: context.bodyLarge,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '®',
                      style: context.bodyLarge?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
