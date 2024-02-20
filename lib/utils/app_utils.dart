import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/signin_response_model.dart';
import '../routes/app_route.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Message", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch (status) {
      case MessageStatus.SUCCESS:
        backgroundColor = Colors.green;
        break;
      case MessageStatus.ERROR:
        backgroundColor = Colors.red;
        break;
      case MessageStatus.WARNING:
        backgroundColor = Colors.orange;
        break;
      case MessageStatus.NORMAL:
        backgroundColor = Colors.grey;
        break;
    }
    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: backgroundColor,
    );
  }

  static SignInResponseModel loginUserDetail() {
    return SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)));
  }

  static void logout() async {
    await GetStorage().remove(KEY_USER_DATA);
    Get.offAllNamed(AppRoutes.signinScreen);
  }
}
