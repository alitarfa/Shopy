import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  // 812 is the layout height that designer use
  double height = SizeConfig._mediaQueryData.size.height;
  return (inputHeight / 812.0) * height;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double width = SizeConfig._mediaQueryData.size.width;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * width;
}
