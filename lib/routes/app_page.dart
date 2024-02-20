import 'package:get/get.dart';

import '../modules/welcome/welcome_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/welcome/welcome_screen.dart';
import '../modules/onboard/onboard_binding.dart';
import '../modules/onboard/onboard_screen.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_screen.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_screen.dart';
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
    GetPage(
        name: AppRoutes.onboardScreen,
        page: () => OnboardScreen(),
        binding: OnboardBinding()),
    GetPage(
        name: AppRoutes.signupScreen, 
        page: (() => SignupScreen()),
        binding: SignupBinding()),
    GetPage(
        name: AppRoutes.signinScreen,
        page: () => SigninScreen(),
        binding: SigninBinding()),
  ];
}
