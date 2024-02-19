import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../model/signup_post_body_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';
import '../../apis/signup_api.dart';
import '../../routes/app_route.dart';

class SignupController extends GetxController {
  SignUpApi signUpApi = SignUpApi();

  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  bool _signUpFormValidation() {
    if (firstNameController.text.isEmpty) {
      errorMessage = "First Name is required";
      return false;
    }
    if (lastNameController.text.isEmpty) {
      errorMessage = "Last Name is required";
      return false;
    }
    if (emailController.text.isEmpty) {
      errorMessage = "Email is required";
      return false;
    }
    if (passwordController.text.isEmpty) {
      errorMessage = "Password is required";
      return false;
    }
    return true;
  }

  void signUp() async {
    if (_signUpFormValidation()) {
      SignUpPostBodyModel signUpPostBodyModel = SignUpPostBodyModel(
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          password: passwordController.text);
      isLoading(true);
      var response =
          await signUpApi.signUp(signUpPostBodyModel: signUpPostBodyModel);
      if (response.code == 200 || response.code == 210) {
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.splashScreen);
        AppUtils.showSnackBar("Sign Up Succesful", status: MessageStatus.SUCCESS);
      }
      else{
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Error",
            status: MessageStatus.ERROR);
      }
    }
    else{
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
