import '../model/all_interested_show_response_model.dart';
import '../model/user_subscribe_show_put_body_model.dart';
import '../model/user_subscribe_show_response_model.dart';
import '../utils/dio_client.dart';

class AllInterestShowApi {
  Future<AllInsteredShowResponseModel> fetchShow() async {
    try {
      final response =
          await DioClient.getDioInstance().get("api/show/all-interested-shows");
      return AllInsteredShowResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSubscribeShowResponseModel> subscribeShow(String userId,
      UserSubscribeShowPutBodyModel userInterestCategoryPutBodyModel) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/user/update/$userId",
          data: userInterestCategoryPutBodyModel.toJson());
      return UserSubscribeShowResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
