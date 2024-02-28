import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_route.dart';
import 'signin_controller.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                backgroundColor: Colors.transparent,
                centerTitle: false,
                elevation: 0,
              ),
              body: Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/logo.png"),
                            height: 100,
                          ),
                          Text(
                            "Login to Your Account",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Form(
                              key: controller.signinFormKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: controller.emailController,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          size: 18,
                                        ),
                                        contentPadding: EdgeInsets.all(12),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      keyboardType: TextInputType.text,
                                      obscureText:
                                          controller.passwordInVisible.value,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          size: 18,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            controller.passwordInVisible.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            controller.passwordInVisible.value =
                                                !controller
                                                    .passwordInVisible.value;
                                          },
                                        ),
                                        contentPadding: EdgeInsets.all(12),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.forgotPasswordScreen);
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFAB3CFF),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ])),
                          SizedBox(
                            height: 70,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.signIn();
                                },
                                child: Text(
                                  "Sign In",
                                  style: const TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: const Color(0xFFAB3CFF),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        text: "Don't have an account?"),
                                    TextSpan(
                                        text: " Sign Up",
                                        style: TextStyle(
                                            color: Color(0xFFAB3CFF),
                                            fontSize: 18),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Get.toNamed(
                                              AppRoutes.signupScreen))
                                  ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))),
            ));
  }
}
