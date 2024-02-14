import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../welcome/welcome_controller.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.contents.length,
                onPageChanged: (index) =>
                    controller.selectedPageIndex.value = index,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                  child: Column(
                    children: [
                      Image.asset(
                        controller.contents[i].image,
                        height: 400,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.contents[i].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xFFAB3CFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
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
            ),
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
