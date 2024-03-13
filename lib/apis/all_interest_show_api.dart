import '../model/all_interested_show_response_model.dart';
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
}
