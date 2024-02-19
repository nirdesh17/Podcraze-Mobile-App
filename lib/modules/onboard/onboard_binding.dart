import 'package:get/get.dart';

import '../onboard/onboard_controller.dart';



class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
  }
}