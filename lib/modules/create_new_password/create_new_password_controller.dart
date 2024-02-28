import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/create_new_password_post_body_model.dart';
import '../../apis/reset_password_api.dart';
import '../../routes/app_route.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';


class CreateNewPasswordController extends GetxController {
  ResetPasswordApi resetPasswordApi = ResetPasswordApi();

  final arguments = Get.arguments;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;
  var confirmPasswordInVisible = true.obs;

  var errorMessage = "";
  var email = "";
  var otp = "";

  @override
  void onInit() {
    if (arguments != null) {
      email = arguments[ARG_EMAIL];
      otp = arguments[ARG_OTP];
      super.onInit();
    }
  }

  bool _newPasswordFormValidation() {
    if (passwordController.text.isEmpty) {
      errorMessage = "Password is required";
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorMessage = "Confirm Password is required";
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      errorMessage = "Password and Confirm Password should be same";
      return false;
    } else {
      return true;
    }
  }

  void createNewPassword(BuildContext context) async {
    if (_newPasswordFormValidation()) {
      CreateNewPasswordPostBodyModel createNewPasswordPostBodyModel =
          CreateNewPasswordPostBodyModel(
              email: email, otp: otp, newPassword: passwordController.text);

      isLoading.value = true;
      var response = await resetPasswordApi.createNewPassword(
          createNewPasswordPostBodyModel: createNewPasswordPostBodyModel);

      if (response.code == 200) {
        isLoading.value = false;
        // Get.offAllNamed(AppRoutes.signinScreen);
        _showCongratulationDialog(context);
        Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(
              AppRoutes.signinScreen,
            ));
        // AppUtils.showSnackBar(
        //     response.message ??
        //         "New password created successfully. Please login",
        //     title: "Success",
        //     status: MessageStatus.SUCCESS);
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Error",
            status: MessageStatus.ERROR);
      }
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }

}
void _showCongratulationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white, // Set the background color of the dialog to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Optional: Set the border radius of the dialog
        ),
        child: Container(
          padding: EdgeInsets.all(20.0), // Optional: Add padding to the container
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage("assets/images/setup_successful.png"),
                height: 250,
              ),
              SizedBox(height: 20),
              Text(
                'Your password has been reset successfully. You will be redirected to the Login Screen in a few seconds.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // CircularProgressIndicator(), // Optional: Add a loading indicator
            ],
          ),
        ),
      );
    },
  );
}
