import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/welocme_model.dart';
import '../../routes/app_route.dart';

class WelcomeController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == contents.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offNamed(AppRoutes.onboardScreen);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<WelcomeModel> contents = [
    WelcomeModel(
        image: 'assets/images/onboarding_1.png',
        description: "Welcome to Podcraze, the best podcast app for you."),
    WelcomeModel(
        image: 'assets/images/onboarding_2.png',
        description: "Discover and listen to your favorite podcasts."),
    WelcomeModel(
        image: 'assets/images/onboarding_3.png',
        description:
            "Create your own playlist and enjoy your favorite podcasts."),
  ];
}
