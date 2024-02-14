import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_screen.dart';
import 'routes/app_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcraze',
      home: SplashScreen(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
