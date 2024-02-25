import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyOtpController verifyOtpController = Get.find<VerifyOtpController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Obx(() => verifyOtpController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You've got MAIL 📲",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Text(
                      "We have sent the OTP verification code to your mail(${verifyOtpController.email.value}). Check your mail and enter the code below",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          otpInputField(
                              verifyOtpController.firstOtpDigitController,
                              verifyOtpController.firstFocusNode),
                          otpInputField(
                              verifyOtpController.secondOtpDigitController,
                              verifyOtpController.secondFocusNode),
                          otpInputField(
                              verifyOtpController.thirdOtpDigitController,
                              verifyOtpController.thirdFocusNode),
                          otpInputField(
                              verifyOtpController.fourthOtpDigitController,
                              verifyOtpController.fourthFocusNode),
                          otpInputField(
                              verifyOtpController.fifthOtpDigitController,
                              verifyOtpController.fifthFocusNode),
                          otpInputField(
                              verifyOtpController.sixthOtpDigitController,
                              verifyOtpController.sixthFocusNode),
                        ]),
                    SizedBox(height: 44),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                          onPressed: () {
                            verifyOtpController.verifyOtp();
                          },
                          child: Text(
                            "Verify OTP",
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFFAB3CFF),
                          )),
                    )
                  ],
                ),
              ),
            )),
    );
  }

  Container otpInputField(
      TextEditingController controller, FocusNode focusNode) {
    return Container(
      width: 44,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        maxLength: 1,
        maxLines: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            focusNode.nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.all(4),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
