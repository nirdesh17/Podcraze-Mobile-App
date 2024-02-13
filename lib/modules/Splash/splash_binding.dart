import 'package:get/get.dart';
import 'package:podcraze/modules/Splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
