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
  ];

  //* to navigators
  static void toHome() {
    Get.toNamed(homeRoute);
  }

  //* off navigators
  static void offHome() {
    Get.offNamed(homeRoute);
  }

  //* back (pop)
  static void back() {
    Get.back();
  }
}
