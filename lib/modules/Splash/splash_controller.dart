import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_route.dart';

class SplashController extends GetxController {
  final localStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(
              AppRoutes.welcomeScreen,
            ));
  }
}
