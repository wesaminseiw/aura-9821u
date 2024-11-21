import 'package:aura/presentation/screens/auth_screens/signin_screen.dart';
import 'package:aura/presentation/screens/auth_screens/signup_screen.dart';
import 'package:aura/presentation/screens/auth_screens/verify_email_screen.dart';

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
  ];

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

  //* back (pop)
  static void back() {
    Get.back();
  }
}
