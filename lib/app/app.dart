import 'package:aura/app/router.dart';
import 'package:aura/presentation/screens/splash_screen.dart';
import 'package:aura/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aura',
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      getPages: AppRouter.routes,
      home: SplashScreen(),
    );
  }
}
