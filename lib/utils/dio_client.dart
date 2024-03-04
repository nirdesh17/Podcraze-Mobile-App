import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '/utils/constants.dart';
import 'api_logging_interceptor.dart';
import 'app_utils.dart';
import 'error_handling_interceptor.dart';

class DioClient {
  static Dio getDioInstance() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "application/json"
      ..options.headers["Authorization"] =
          GetStorage().read(KEY_USER_DATA) == null
              ? ""
              : "Bearer ${AppUtils.loginUserDetail().result?.token}"
      ..interceptors.add(ErrorHandlingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
}
