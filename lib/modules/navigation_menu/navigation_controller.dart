import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.pink)
  ];
}
