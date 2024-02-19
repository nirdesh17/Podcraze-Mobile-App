import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) =>  Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/images/logo.png'),
                    ),
                    Text(
                      'Podcraze',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              child: Image(
                image: AssetImage('assets/images/loading_indication.png'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
