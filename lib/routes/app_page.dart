import 'package:get/get.dart';

import '../modules/verify_otp/verify_otp_binding.dart';
import '../modules/verify_otp/verify_otp_screen.dart';
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
import '../modules/forgot_password/forgot_password_binding.dart';
import '../modules/forgot_password/forgot_password_screen.dart';
import '../modules/create_new_password/create_new_password_binding.dart';
import '../modules/create_new_password/create_new_password_screen.dart';
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
    GetPage(
        name: AppRoutes.verifyOtpScreen, 
        page: ()=> VerifyOtpScreen(),
        binding: VerifyOtpBinding()),
    GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: ()=> ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.createNewPasswordScreen,
        page: ()=> CreateNewPasswordScreen(),
        binding: CreateNewPasswordBinding()
    )
  ];
}
