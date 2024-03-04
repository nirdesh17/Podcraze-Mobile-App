import 'package:dio/dio.dart';

import '../model/interest_category_response_model.dart';
import '../model/user_interest_category_put_body_model.dart';
import '../model/user_interest_category_response_model.dart';
import '../utils/dio_client.dart';

class InterestCategoryApi{
  Future<InterestCategoryResponseModel> fetchCategory(String token) async{
    try{
      final response= await DioClient.getDioInstance()
      .get("api/show-category/all",
      options: Options(headers: {
          'Authorization': 'Bearer $token',}),);
      return InterestCategoryResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserInterestCategoryResponseModel> updateCategory(String token, int id, UserInterestCategoryPutBodyModel userInterestCategoryPutBodyModel) async{
    try{
      final response = await DioClient.getDioInstance()
      .put("api/user/update/$id",
      options: Options(headers: {
        'Authorization':'Bearer $token',}),data: userInterestCategoryPutBodyModel.toJson());
        return UserInterestCategoryResponseModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }
}