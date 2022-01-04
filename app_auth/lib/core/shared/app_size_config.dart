import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AppSize {
  static double? screenWidth;
  static double? screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;

  void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;

    _blockWidth = screenWidth! / 100;
    _blockHeight = screenHeight! / 100;

    textMultiplier = _blockWidth;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}
