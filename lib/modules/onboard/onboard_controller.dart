import 'package:get/get.dart';

import '../../routes/app_route.dart';
class OnboardController extends GetxController {
  forwardAction(){
    Get.toNamed(AppRoutes.signupScreen);
  }
}
