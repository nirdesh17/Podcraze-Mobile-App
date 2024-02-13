import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraze/modules/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'assets/images/1_Light_splash screen4k.png'),
                    ),
                    Text(
                      'Procraze',
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
