import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_utils.dart';
import '../../model/forgot_password_post_body_model.dart';
import '../../routes/app_route.dart';
import '../../apis/forgot_password_api.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordApi forgotPasswordApi = ForgotPasswordApi();

  final GlobalKey<FormState> forgotPasswordFormKey =
      GlobalKey<FormState>(debugLabel: '_forgotPasswordFormKey_');

  final emailController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessages = "";

  bool _forgotPasswordFormValidation() {
    if (emailController.text.isEmpty) {
      errorMessages = "Email is required";
      return false;
    } else {
      return true;
    }
  }

  void forgotPassword() async {
    if (_forgotPasswordFormValidation()) {
      ForgotPasswordPostBodyModel forgotPasswordPostBodyModel =
          ForgotPasswordPostBodyModel(email: emailController.text);

      isLoading.value = true;

      var response = await forgotPasswordApi.forgotPassword(
          forgotPasswordPostBodyModel: forgotPasswordPostBodyModel);
      if (response.code == 200 || response.code == 210) {
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.verifyOtpScreen, arguments: {
          ARG_EMAIL: emailController.text,
          ARG_FROM_FORGOT_PASSWORD: true,
        });
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar("Email not found", status: MessageStatus.ERROR);
      }
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
