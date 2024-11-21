import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 1), () {
      // TODO: change the duration of the splash to 2.5/3sec
      AppRouter.offHome();
    });
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
                  'aura',
                  textAlign: TextAlign.center,
                  style: context.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4), // Small space between the lines
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'by Wes',
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
