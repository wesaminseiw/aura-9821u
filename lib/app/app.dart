import 'package:aura/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aura',
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: HomeScreen(),
    );
  }
}
