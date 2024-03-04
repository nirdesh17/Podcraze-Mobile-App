import 'package:get/get.dart';

import 'interest_category_controller.dart';

class InterestCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestCategoryController());
  }
}
