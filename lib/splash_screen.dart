import 'package:flutter/material.dart';
import 'package:podcraze/intro_slider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// Flag to track loading state

  @override
  void initState() {
    super.initState();
    // Simulate loading time
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }

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
                            'assets/images/1_Light_splash screen4k.png')),
                    Text('Procraze',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              child: Image(
                  image: AssetImage('assets/images/loading_indication.png')),
            ),
          ],
        ),
      ),
    );
  }
}
