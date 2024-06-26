import '../../model/verify_otp_post_body_model.dart';
import '../../model/verify_otp_response_model.dart';
import '../../utils/dio_client.dart';

class VerifyOtpApi {
  Future<VerifyOtpResponseModel> verifyOtp(
      {required VerifyOtpPostBodyModel verifyOtpPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().post(
          "api/user/verify/email-otp",
          data: verifyOtpPostBodyModel.toJson());
      return VerifyOtpResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
