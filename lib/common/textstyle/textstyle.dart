import 'package:zlocation/common/const/cosnt.dart';
import 'package:flutter/material.dart';
export '../const/cosnt.dart' show AppColor;

enum FamilyEnum {
  normal,
  medium,
  bold,
}

class AppFont {
  static TextStyle textStyle(double fontszie, 
  {
    FontWeight fontWeight = FontWeight.normal, 
    FamilyEnum family = FamilyEnum.normal,
    Color color = AppColor.font333,
    bool showshadow = false,
    TextDecoration decoration = TextDecoration.none}) {

    String fontFamily = "PingFang-Regular";

    switch (family) {
      case FamilyEnum.medium:
        fontFamily = "PingFang-Medium";
        break;
      case FamilyEnum.bold:
        fontFamily = "PingFang-Bold";
        break;
      default:
    }

    return TextStyle(
      fontSize: fontszie,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
      shadows: showshadow == false ? [] : [
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
      fontFamily: fontFamily
    );
  }
}