import 'package:get/get.dart';

import 'subscribe_show_controller.dart';

class SubscribeShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscribeShowController());
  }
}