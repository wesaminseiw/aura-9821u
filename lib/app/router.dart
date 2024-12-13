import 'package:aura/presentation/screens/auth_screens/signin_screen.dart';
import 'package:aura/presentation/screens/auth_screens/signup_screen.dart';
import 'package:aura/presentation/screens/auth_screens/verify_email_screen.dart';
import 'package:aura/presentation/screens/customization_screens/customization_screen.dart';
import 'package:aura/presentation/screens/profile_screen.dart';
import 'package:aura/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';
import '../presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  //* routes defining
  static final List<GetPage> routes = [
    GetPage(
      name: homeRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: signInRoute,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: signUpRoute,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: verifyEmailRoute,
      page: () => const VerifyEmailScreen(),
    ),
    GetPage(
      name: customizationRoute,
      page: () => const CustomizationScreen(),
    ),
  ];

  //* customized navigators
  static void offAllNavigateWithoutAnimation(route) {
    Get.offAll(
      () => route == '/home'
          ? const HomeScreen()
          : route == '/profile'
              ? const ProfileScreen()
              : SearchScreen(),
      transition: Transition.noTransition, // No transition (like Duration.zero)
      curve: Curves.linear, // Optional, used for transition timing curve
    );
  }

  //* to navigators
  static void toHome() {
    Get.toNamed(homeRoute);
  }

  static void toSignIn() {
    Get.toNamed(signInRoute);
  }

  static void toSignUp() {
    Get.toNamed(signUpRoute);
  }

  static void toVerifyEmail() {
    Get.toNamed(verifyEmailRoute);
  }

  static void toCustomization() {
    Get.toNamed(customizationRoute);
  }

  //* off navigators
  static void offHome() {
    Get.offNamed(homeRoute);
  }

  static void offSignIn() {
    Get.offNamed(signInRoute);
  }

  static void offSignUp() {
    Get.offNamed(signUpRoute);
  }

  static void offVerifyEmail() {
    Get.offNamed(verifyEmailRoute);
  }

  static void offCustomization() {
    Get.offNamed(customizationRoute);
  }

  //* back (pop)
  static void back() {
    Get.back();
  }
}
