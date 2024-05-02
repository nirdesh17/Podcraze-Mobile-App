import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller
                            .firstName.value, // Access the value of RxString
                      ),
                      SizedBox(height: 20),
                      Text(
                        controller.lastName.value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: NetworkImage(
                          controller.image.value,
                        ), // Placeholder URL
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
