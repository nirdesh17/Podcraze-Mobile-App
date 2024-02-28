import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewPasswordController>(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                                "assets/images/create_new_password.png"),
                            height: 250,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "New Password",
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
                                            !controller.passwordInVisible.value;
                                      },
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "New Password",
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
                                  "Confirm New Password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                TextFormField(
                                  controller:
                                      controller.confirmPasswordController,
                                  keyboardType: TextInputType.text,
                                  obscureText:
                                      controller.confirmPasswordInVisible.value,
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
                                        controller
                                                .confirmPasswordInVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        controller.confirmPasswordInVisible
                                                .value =
                                            !controller
                                                .confirmPasswordInVisible.value;
                                      },
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Confirm New Password",
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
                              ])),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.createNewPassword(context);
                                },
                                child: Text(
                                  "Reset Password",
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
                        ],
                      ),
                    ))),
            ));
  }
}
