import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'app_utils.dart';
import '../apis/api_error_response_model.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class ErrorHandlingInterceptor extends Interceptor {
  final localStorage = GetStorage();
  var _isErrorCodeHandled = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (localStorage.read(KEY_IS_API_ERROR_HANDLE) == null)
      _isErrorCodeHandled = false;
    else
      _isErrorCodeHandled = true;

    if (!_isErrorCodeHandled && err.response?.statusCode == 401) {
      _isErrorCodeHandled = true;
      await localStorage.write(KEY_IS_API_ERROR_HANDLE, _isErrorCodeHandled);
      // redirecting to login page if token expire
      AppUtils.showSnackBar("Session Expired Sign Again",
          status: MessageStatus.ERROR);
      AppUtils.logout();
    }
    else {
      if (!_isErrorCodeHandled) {
        print(
            "Error = ${ApiErrorResponseModel.fromJson(err.response?.data).message}");
        AppUtils.showSnackBar(
            "${ApiErrorResponseModel.fromJson(err.response?.data).message}",
            status: MessageStatus.ERROR);
      }
    }
    super.onError(err, handler);
  }
}

