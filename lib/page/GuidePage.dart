import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zlocation/common/const/cosnt.dart';

class GuidePage extends StatefulWidget {

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then((value) => _jumpToRoot(context));
  }


  void _jumpToRoot(BuildContext context) async {
    final share = await SharedPreferences.getInstance();
    print("_jumpToRoot");
    Navigator.of(context).pushNamedAndRemoveUntil('/RootPage', (route) => false);
    // if(share.getString(AppConst.KEY_user_token) != null) {
    //   Navigator.of(context).pushNamedAndRemoveUntil('/root', (route) => false);
    // } else {
    //
    // }
  }

  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    return Scaffold(
      backgroundColor: AppColor.back998,
      body: Center(
        child: Image.asset("assets/启动图.png",),
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage("assets/背景图.png"),
      //           fit: BoxFit.cover
      //       )
      //   ),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Stack(
      //           children: [
      //             Image.asset("assets/手机.png"),
      //             Positioned(
      //               right: 40,
      //               top: 40,
      //               child: InkWell(
      //                   onTap: () => Navigator.pushNamed(context, "/language"),
      //                   child: Image.asset("assets/语言切换.png")
      //               ),
      //             )
      //           ],
      //         ),
      //         SizedBox(height: 40,),
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
