import 'package:flutter/material.dart';

class SizeHelper {
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }

  static double w(double designWidth) => designWidth / 390 * width;
  static double h(double designHeight) => designHeight / 844 * height;
}