import 'package:flutter/material.dart';

class Dimensions {
  static double? ratio;
  static Size? size;
  static double? width;
  static double? height;

  Size screenSize(context) => MediaQuery.of(context).size;

  void init(BuildContext context) {
    size = MediaQuery.of(context).size;
    ratio = size!.height / size!.width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // log('a1 height : ${size!.height}');
    // log('a1 width : ${size!.width}');
    // log('a1 ratio : ${ratio}');
    font(20);
  }

  static double font(double unit) {
    final result =
        (Dimensions.height! * Dimensions.width! * unit) / ratio! * 0.0000012;
    // log('a1: font reult : $result');
    return result;
  }
}
