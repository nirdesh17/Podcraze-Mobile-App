import 'package:dio/dio.dart';


import '/utils/constants.dart';

class DioClient {
  static Dio getDioInstance() {
    var dio=Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: Duration(minutes:2),
      receiveTimeout: Duration(minutes:2),
    ));
    return dio;
  }
}
