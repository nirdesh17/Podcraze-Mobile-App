import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/subscribe_show/subscribe_show_controller.dart';

class SubscribeShowScreen extends StatelessWidget {
  const SubscribeShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribeShowController>(
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
          title: Text('Subscribe Show'),
        ),
      ),
    );
  }
}
