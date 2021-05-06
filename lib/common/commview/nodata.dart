import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';

class NodataView extends StatelessWidget {

  final String title;
  final bool imgnetwork;
  final double marginTop;

  const NodataView({Key key, this.title = "暂无数据", this.marginTop = 40, this.imgnetwork = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: marginTop),
        child: Column(
          children: <Widget>[
            Image.asset(imgnetwork ? "assets/wuwangluo.png" : "assets/wujilu.png"),
            SizedBox(height: imgnetwork ? 16 : 0,),
            Text(imgnetwork ? "网络不给力，请稍后重试" : title, style: AppFont.textStyle(13, color: AppColor.fontgrey),)
          ],
        )
      );
  }
}