import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:zlocation/i18/i18n.dart';

import 'appbar.dart';

class CommbackView extends StatelessWidget {
  final Widget child;
  final List<Widget> actions;
  final Widget leading;
  final String titles;
  final String backImg;
  final Function() onPop;
  final Widget childTitle;
  const CommbackView({Key key, this.backImg = "背景图.png", this.childTitle, this.onPop, this.titles, this.leading, this.actions, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.bg,
          // image: DecorationImage(
          //   image: AssetImage("assets/$backImg"),
          //   fit: BoxFit.cover
          // )
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: NormalAppbar.normal(

                color: Colors.white,
                title: childTitle ?? Text(titles,style: AppFont.textStyle(18, color: AppColor.font333),),
                leading: leading,
                actions: actions,
                onPress: onPop,
              ),
            ),
            Expanded(
              child: child,
            )
          ]
        )
      );
  }
}