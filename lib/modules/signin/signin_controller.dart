import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../model/signin_post_body_model.dart';
import '../../routes/app_route.dart';
import '../../utils/constants.dart';
import '../../apis/signin_api.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class SigninController extends GetxController {
  SignInApi signInApi = SignInApi();

  final localStorage = GetStorage();

  final GlobalKey<FormState> signinFormKey =
      GlobalKey<FormState>(debugLabel: '_signinFormKey_');

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  bool _loginFormValidation() {
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

  void signIn() async {
    if (_loginFormValidation()) {
      SignInPostBodyModel signInPostBodyModel = SignInPostBodyModel(
          email: emailController.text, password: passwordController.text);
      isLoading.value = true;

      var response =
          await signInApi.signUp(signInPostBodyModel: signInPostBodyModel);

      if (response.code == 200 || response.code == 210) {
        GetStorage().remove(KEY_IS_API_ERROR_HANDLE);
        localStorage.write(KEY_USER_DATA, response.toJson());
        isLoading.value = false;
        Get.offNamed(AppRoutes.splashScreen);
        AppUtils.showSnackBar("Sign In Succesful", status: MessageStatus.SUCCESS);
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Error",
            status: MessageStatus.ERROR);
      }
    }
    else {
        isLoading.value = false;
        AppUtils.showSnackBar(errorMessage,
            status: MessageStatus.ERROR);
      }
  }
}
