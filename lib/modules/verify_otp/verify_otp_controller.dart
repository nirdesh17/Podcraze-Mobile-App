import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/verify_otp_post_body_model.dart';
import '../../routes/app_route.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';
import '../../apis/verify_otp_api.dart';
import '../../utils/constants.dart';

class VerifyOtpController extends GetxController {
  VerifyOtpApi verifyOtpApi = VerifyOtpApi();

  final arguments = Get.arguments;

  final firstOtpDigitController = TextEditingController();
  final secondOtpDigitController = TextEditingController();
  final thirdOtpDigitController = TextEditingController();
  final fourthOtpDigitController = TextEditingController();
  final fifthOtpDigitController = TextEditingController();
  final sixthOtpDigitController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();
  final sixthFocusNode = FocusNode();

  var isLoading = false.obs;
  var email = "".obs;
  var check = false.obs;

  @override
  void onInit() {
    final arguments = Get.arguments;
    if (arguments != null) {
      email.value =
          arguments[ARG_EMAIL] ?? ""; // Use default value if ARG_EMAIL is null
      check.value = arguments[ARG_FROM_FORGOT_PASSWORD] ??
          false; // Use default value if ARG_FROM_FORGOT_PASSWORD is null
    }
    super.onInit();
  }

  var errorMessage = "";

  bool _verifyOtpFieldValidation() {
    if (firstOtpDigitController.text.isEmpty ||
        secondOtpDigitController.text.isEmpty ||
        thirdOtpDigitController.text.isEmpty ||
        fourthOtpDigitController.text.isEmpty ||
        fifthOtpDigitController.text.isEmpty ||
        sixthOtpDigitController.text.isEmpty) {
      errorMessage = "OTP fields should not be empty";
      return false;
    } else {
      return true;
    }
  }

  void verifyOtp() async {
    if (_verifyOtpFieldValidation()) {
      isLoading.value = true;
      final otp = firstOtpDigitController.text +
          secondOtpDigitController.text +
          thirdOtpDigitController.text +
          fourthOtpDigitController.text +
          fifthOtpDigitController.text +
          sixthOtpDigitController.text;
      VerifyOtpPostBodyModel verifyOtpPostBodyModel =
          VerifyOtpPostBodyModel(email: email.value, otp: otp);

      var response = await verifyOtpApi.verifyOtp(
          verifyOtpPostBodyModel: verifyOtpPostBodyModel);

      if (response.code == 200) {
        isLoading.value = false;
        // ignore: unrelated_type_equality_checks
        if (check == true) {
          Get.offAllNamed(AppRoutes.createNewPasswordScreen, arguments: {
            ARG_EMAIL: email.value,
            ARG_OTP: otp,
          });
          
        } else {
          Get.offAllNamed(AppRoutes.splashScreen);
          AppUtils.showSnackBar("Verification Successful. Sign Up Successful",
              title: "Verified", status: MessageStatus.SUCCESS);
        }
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Verification Failed",
            title: "Error", status: MessageStatus.ERROR);
      }
    } else {
      AppUtils.showSnackBar(errorMessage,
          title: "Error", status: MessageStatus.ERROR);
    }
  }
}
