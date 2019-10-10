import 'package:flutter/material.dart';

double deviceHeight = 0.0;

class ScreenUtils {
  Size screenSize;

  ScreenUtils(this.screenSize) {
    deviceHeight = deviceHeight == 0 ? screenSize.height : deviceHeight;
  }

  double wp(percentage) {
    double result = (percentage * screenSize.width) / 100;
    return result;
  }

  double hp(percentage) {
    double result = (percentage * deviceHeight) / 100;
    return result;
  }
}
