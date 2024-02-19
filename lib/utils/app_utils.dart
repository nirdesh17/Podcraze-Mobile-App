import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'enums/snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Message", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch(status){
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
}
