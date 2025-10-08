// SizeHelper basically helps scale the size to any phone screen. The value I put inside each Size is the width/height/coord I have in figma, which is the size for iPhone 13/14.


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