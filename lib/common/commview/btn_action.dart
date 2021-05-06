import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';

class BtnAction extends StatelessWidget {
  final Function() onTap;
  final String backImg;
  final String title;
  final bool isaction;
  const BtnAction({Key key, this.isaction = true, this.onTap, this.backImg = "btn_active.png", this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isaction ? onTap : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/$backImg", fit: BoxFit.fill,),
          Text(title, style: AppFont.textStyle(
            14, 
            color: Colors.white, showshadow: true),)
        ],
      ),
    );
  }
}