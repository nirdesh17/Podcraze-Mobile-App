import 'package:get/get.dart';
import 'package:podcraze/modules/Splash/splash_binding.dart';
import 'package:podcraze/modules/Splash/splash_screen.dart';
import 'package:podcraze/modules/Welcome/welcome_screen.dart';
import 'package:podcraze/modules/Welcome/welcome_binding.dart';
import 'package:podcraze/routes/app_route.dart';

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
