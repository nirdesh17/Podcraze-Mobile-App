import 'package:get/get.dart';

import '../../apis/interest_category_api.dart';
import '../../model/interest_category_response_model.dart';
import '../../model/user_interest_category_put_body_model.dart';
import '../../routes/app_route.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class InterestCategoryController extends GetxController {
  InterestCategoryApi interestCategoryApi = InterestCategoryApi();

  var isLoading = false.obs;
  List<InterestCategory> categories = <InterestCategory>[].obs;
  List<UserInterestCategory> selectedCategories = <UserInterestCategory>[].obs;

  final arguments = Get.arguments;
  var userId = "";

  @override
  void onInit() {
    super.onInit();
    userId = AppUtils.loginUserDetail().result?.id.toString() ?? "";
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading.value = true;
    var response = await interestCategoryApi.fetchCategory();
    if (response.code == 200 || response.code == 210) {
      isLoading.value = false;
      categories.assignAll(response.result ?? []);
      print("All good");
    } else {
      AppUtils.showSnackBar("not fetch",
          title: "Error", status: MessageStatus.ERROR);
    }
  }

  void sendCategories() async {
    isLoading.value = true;
    UserInterestCategoryPutBodyModel userInterestCategoryPutBodyModel =
        UserInterestCategoryPutBodyModel(
            userInterest: selectedCategories.toList());
    var response = await interestCategoryApi.updateCategory(
        userId, userInterestCategoryPutBodyModel);
    if (response.code == 200 || response.code == 210) {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.subscribeShowScreen);
      print("category added");
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("not added",
          title: "Error", status: MessageStatus.ERROR);
    }
  }

  void toggleCategorySelection(InterestCategory category) {
    category.isSelected = !category.isSelected;
    if (category.isSelected) {
      // Convert InterestCategory to UserInterestCategory before adding
      selectedCategories
          .add(UserInterestCategory(id: category.id, name: category.name));
    } else {
      selectedCategories
          .removeWhere((e) => e.id == category.id); // Remove by id
    }
    update(); // Update the UI after selection change
  }
}
