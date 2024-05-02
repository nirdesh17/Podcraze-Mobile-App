import 'package:get/get.dart';


import '../../model/user_subscribe_show_put_body_model.dart';
import '../../routes/app_route.dart';
import '../../utils/app_utils.dart';
import '../../apis/all_interest_show_api.dart';
import '../../model/all_interested_show_response_model.dart';
import '../../utils/enums/snackbar_status.dart';

class SubscribeShowController extends GetxController {
  AllInterestShowApi allInterestShowApi = AllInterestShowApi();

  var isLoading = false.obs;
  List<Result> shows = <Result>[].obs;
  List<UserSubscribeShow> selectedShows = <UserSubscribeShow>[].obs;

  final arguments = Get.arguments;
  var userId = "";

  @override
  void onInit() {
    super.onInit();
    userId = AppUtils.loginUserDetail().result?.id.toString() ?? "";
    fetchShows();
  }

  void fetchShows() async {
    isLoading.value = true;
    var response = await allInterestShowApi.fetchShow();
    if(response.code==200 || response.code==210)
    {
      isLoading.value = false;
      shows.assignAll(response.result ?? []);
      print("All good");
    }
    else
    {
      AppUtils.showSnackBar("not fetch",
          title: "Error", status: MessageStatus.ERROR);
    }
  }


  void sendShows() async {
    isLoading.value = true;
    UserSubscribeShowPutBodyModel userSubscribeShowPutBodyModel =
        UserSubscribeShowPutBodyModel(
            userSubscribe: selectedShows.toList());
    var response = await allInterestShowApi.subscribeShow(
        userId, userSubscribeShowPutBodyModel);
    if (response.code == 200 || response.code == 210) {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.homeScreen);
      print("category added");
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("not added",
          title: "Error", status: MessageStatus.ERROR);
    }
  }


  void toggleShowSubscribe(Result show) {
    show.isSubscribe = !show.isSubscribe;
    if(show.isSubscribe)
    {
      selectedShows.add(UserSubscribeShow(id: show.id, name: show.showName));
    }
    else
    {
      selectedShows.removeWhere((element) => element.id == show.id);
    }
    update(); // Update the UI after selection change
  }
}


