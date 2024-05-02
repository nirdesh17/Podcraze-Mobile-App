import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/navigation_menu/navigation_controller.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return GetBuilder<NavigationController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: Obx(() => NavigationBar(
                    height: screenHeight * 0.08,
                    elevation: 0,
                    selectedIndex: controller.selectedIndex.value,
                    onDestinationSelected: (index) =>
                        controller.selectedIndex.value = index,
                    destinations: const [
                      NavigationDestination(
                          icon: Icon(Icons.home), label: 'Home'),
                      NavigationDestination(
                          icon: Icon(Icons.search), label: 'Discover'),
                      NavigationDestination(
                          icon: Icon(Icons.playlist_play), label: 'Library'),
                      NavigationDestination(
                          icon: Icon(Icons.person), label: 'Profile')
                    ],
                  )),
              body:
                  Obx(() => controller.screens[controller.selectedIndex.value]),
            ));
  }
}
