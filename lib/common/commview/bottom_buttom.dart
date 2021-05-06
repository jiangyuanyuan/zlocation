import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final String title;
  final Function() onTap;
  final Color bgColor;
  final EdgeInsets margin;

  const BottomButton({Key key, this.title, this.bgColor = AppColor.blue, this.onTap, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: margin ?? const EdgeInsets.all(15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: size.width,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: bgColor
          ),
          alignment: Alignment.center,
          child: Text(title, style: AppFont.textStyle(16, color: Colors.white),),
        ),
      ),
    );
  }
}