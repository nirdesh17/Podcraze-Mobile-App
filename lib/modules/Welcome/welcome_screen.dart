import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcome/welcome_controller.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.contents.length,
                    onPageChanged: (index) =>
                        controller.selectedPageIndex.value = index,
                    itemBuilder: (_, i) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.1,
                        vertical: constraints.maxHeight * 0.2,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            controller.contents[i].image,
                            height: constraints.maxHeight * 0.4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            controller.contents[i].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.06,
                              color: Color(0xFFAB3CFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(() => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                )),
            Obx(() => Container(
                  height: 60,
                  margin: EdgeInsets.all(40),
                  width: double.infinity,
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
                      controller.isLastPage ? "Continue" : "Next",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: Get.find<WelcomeController>().selectedPageIndex.value == index
          ? 25
          : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFAB3CFF),
      ),
    );
  }
}
