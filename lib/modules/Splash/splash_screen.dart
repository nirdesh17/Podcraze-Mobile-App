import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find<SplashController>();
    return const Scaffold(
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
                          'assets/images/1_Light_splash screen4k.PNG'),
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
    );
  }
}
