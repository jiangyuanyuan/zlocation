import 'package:flutter/material.dart';

class AppConst {
  ///
  ///
  ///
  /// 是否是发布版本
  ///
  /// 修改这个,注意修改single => websocket的地址
  ///
  static const bool APP_IS_RELEASE = true;

  ///
  /// usertoken
  static const String KEY_user_token = "KEY_user_token";

  ///
  /// 是否是第一次登录
  ///
  static const String APP_IS_FIRST = "APP_IS_FIRST";

  ///
  /// 是否已经登录
  ///
  static const String APP_IS_LOGIN = "APP_IS_LOGIN";

  /// 缓存的banner图
  static const String APP_BANNERS_KEY = "APP_BANNERS_KEY";
}

class AppColor {
  static const Color blue = Color(0xff1476FE);
  static const Color yellowMain = Color(0xff3F1E1B);
  static const Color green = Color(0xff00BC6B);
  static const Color red = Color(0xffF21412);
  static const Color grey = Color(0xfff9f9f9);
  static const Color yellow = Color(0xffFFB819);

  /// f9f9f9
  static const Color f9f9f9 = Color(0xfff9f9f9);
  static const Color ccc = Color(0xfffcccccc);

  /// a5a5a5
  static const Color fontgrey = Color(0xffa5a5a5);
  static const Color font666 = Color(0xff666666);
  static const Color font333 = Color(0xff333333);
  static const Color fontred = Color(0xffE8286E);
  static const Color font5C3F2E = Color(0xff5C3F2E);
  static const Color font3D3732 = Color(0xff3D3732);
  static const Color fontE9D1BB= Color(0xffE9D1BB);

  /// f3f3f3
  static const Color divigrey = Color(0xfff3f3f3);
  static const Color back998 = Color(0xff4C7998);

  static const Color bg = Color(0xffF8F9FD);
  static const Color bgsk = Color(0xffF1F2F6);
  static const Color line = Color(0xffE5E5E5);

  
}
