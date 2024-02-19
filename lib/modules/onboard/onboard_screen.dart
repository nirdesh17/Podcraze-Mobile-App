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
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/lets_you_in.png')),
                      ],
                    ),
                    Positioned(
                      bottom: 200,
                      child: Container(
                        height: 60,
                        width: 350,
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
                            "Sign UP",
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 150,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              text: "Already have an account?"),
                          TextSpan(
                              text: " Sign In",
                              style: TextStyle(
                                  color: Color(0xFFAB3CFF), fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.toNamed(AppRoutes.splashScreen))
                        ])))
                  ],
                ),
              ),
            ));
  }
}
