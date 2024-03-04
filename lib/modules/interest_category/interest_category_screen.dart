import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'interest_category_controller.dart';

class InterestCategoryScreen extends StatelessWidget {
  const InterestCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterestCategoryController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
          title: Text('Select Your Interest'),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.0), // Add space below app bar
                        Text(
                          "Choose your interest and get the best podcast recommendations. Don't worry, you can change this later.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.0), // Add space below text
                        Wrap(
                          spacing: 30.0,
                          runSpacing: 10.0,
                          children: controller.categories.map((category) {
                            return ChoiceChip(
                              label: Text(category.name!),
                              selected: category.isSelected,
                              onSelected: (isSelected) {
                                controller.toggleCategorySelection(category);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: Color(0xFFAB3CFF), // Set border color
                                  width: 1.0, // Set border width
                                ),
                              ),
                              backgroundColor: Colors.white,
                              selectedColor: Color(0xFFAB3CFF),
                              showCheckmark: false,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: category.isSelected
                                    ? Colors.white
                                    : Color(0xFFAB3CFF), // Set text color
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 30.0), // Add space below chips
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 18)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFAB3CFF)),
                              ),
                              onPressed: () {
                                // Add skip button functionality
                              },
                              child: Text('Skip'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFAB3CFF)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 18)), // Text style
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white), // Text color
                              ),
                              onPressed: () {
                                controller.sendCategories();
                              },
                              child: Text('Continue'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
