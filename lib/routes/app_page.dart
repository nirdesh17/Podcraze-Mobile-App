import 'package:get/get.dart';

import '../modules/Welcome/welcome_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/welcome/welcome_screen.dart';
import 'app_route.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.welcomeScreen,
        page: () => WelcomeScreen(),
        binding: WelcomeBinding()),
  ];
}
