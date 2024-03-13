import 'package:get/get.dart';
import 'package:podcraze/utils/app_utils.dart';

import '../../apis/all_interest_show_api.dart';
import '../../model/all_interested_show_response_model.dart';
import '../../utils/enums/snackbar_status.dart';

class SubscribeShowController extends GetxController {
  AllInterestShowApi allInterestShowApi = AllInterestShowApi();

  var isLoading = false.obs;
  List<Result> shows = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchShows();
  }

  void fetchShows() async {
    isLoading.value = true;
    var response = await allInterestShowApi.fetchShow();
    if(response.code==200 || response.code==210)
    {
      isLoading.value = false;
      shows.assignAll(response.result);
      print("All good");
    }
    else
    {
      AppUtils.showSnackBar("not fetch",
          title: "Error", status: MessageStatus.ERROR);
    }
  }



  void toggleShowSubscribe(Result show) {
    show.isSubscribe = !show.isSubscribe;
    update(); // Update the UI after selection change
  }
}


