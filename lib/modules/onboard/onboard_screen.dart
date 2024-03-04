import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:podcraze/routes/app_route.dart';
import '../onboard/onboard_controller.dart';

class OnboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/images/lets_you_in.png'),
                            height: 240,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              text: "Already have an account?"),
                          TextSpan(
                              text: " Sign In",
                              style: TextStyle(
                                  color: Color(0xFFAB3CFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.toNamed(AppRoutes.signinScreen))
                        ])),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          child: TextButton(
                            onPressed: () => controller.forwardAction(),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFAB3CFF),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
