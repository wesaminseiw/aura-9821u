import 'package:aura/app/router.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/presentation/screens/splash_screen.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:aura/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: aura,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      getPages: AppRouter.routes,
      builder: (context, child) {
        // Get system brightness
        final brightness = isDarkMode(context) ? Brightness.dark : Brightness.light;

        // Set system UI styles based on the brightness
        _setSystemUIOverlay(context, brightness);

        return child!;
      },
      home: SplashScreen(),
    );
  }

  void _setSystemUIOverlay(BuildContext context, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: isDarkMode(context) ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkMode(context) ? darkBackgroundColor : lightBackgroundColor,
        systemNavigationBarIconBrightness: isDarkMode(context) ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.transparent, // Keep the status bar transparent
      ),
    );
  }
}
