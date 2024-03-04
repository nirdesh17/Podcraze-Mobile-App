import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:podcraze/utils/api_logging_interceptor.dart';
import 'package:podcraze/utils/app_utils.dart';
import 'package:podcraze/utils/error_handling_interceptor.dart';

import '/utils/constants.dart';

class DioClient {
  static Dio getDioInstance() {
    final accessToken = AppUtils.loginUserDetail().result?.token;
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "application/json"
      ..options.headers["Authorization"] =
          GetStorage().read(KEY_USER_DATA) == null ? "" : "Bearer $accessToken"
      ..interceptors.add(ErrorHandlingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
}
