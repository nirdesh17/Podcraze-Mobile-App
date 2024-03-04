import 'package:get/get.dart';
// import 'package:podcraze/routes/app_route.dart';

import '../../apis/interest_category_api.dart';
import '../../model/interest_category_response_model.dart';
import '../../model/user_interest_category_put_body_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class InterestCategoryController extends GetxController {
  InterestCategoryApi interestCategoryApi = InterestCategoryApi();

  var isLoading = false.obs;
  List<InterestCategory> categories = <InterestCategory>[].obs;
  List<UserInterestCategory> selectedCategories = <UserInterestCategory>[].obs;
  var token = "".obs;
  var id = 0.obs;
  final arguments = Get.arguments;


  @override
  void onInit() {
    if (arguments != null) {
      token.value = arguments[ARG_TOKEN] ?? "";
      id.value = arguments[ARG_USER_ID] ?? 0;
    }
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading.value = true;
    var response = await interestCategoryApi.fetchCategory(token.value);
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
        UserInterestCategoryPutBodyModel(result: selectedCategories.toList());
    var response = await interestCategoryApi.updateCategory(
        token.value, id.value, userInterestCategoryPutBodyModel);
    if (response.code == 200 || response.code == 210) {
      isLoading.value = false;
      
      // Get.toNamed(AppRoutes.splashScreen);
      print("category added");
    } else {
      AppUtils.showSnackBar("not added",
          title: "Error", status: MessageStatus.ERROR);
    }
  }

  void toggleCategorySelection(InterestCategory category) {
    category.isSelected = !category.isSelected;
    if (category.isSelected) {
      // Convert InterestCategory to UserInterestCategory before adding
      selectedCategories.add(UserInterestCategory(id: category.id, name: category.name));
    } else {
      selectedCategories.removeWhere((e) => e.id == category.id); // Remove by id
    }
    update(); // Update the UI after selection change
}

}
