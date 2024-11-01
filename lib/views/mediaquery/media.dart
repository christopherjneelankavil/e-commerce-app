import 'package:flutter/material.dart';

class ScreenSize {
  static double width = 0;
  static double height = 0;
  static late double blockWidth;
  static late double blockHeight;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    blockWidth = width / 100;
    blockHeight = height / 100;

    textMultiplier = blockHeight;
    imageSizeMultiplier = blockWidth;
    heightMultiplier = blockHeight;
    widthMultiplier = blockWidth;
  }
}
