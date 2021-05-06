import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';

class BtnImageBottomView extends StatelessWidget {
  final String title;
  final String img;
  final Function() onTap;

  const BtnImageBottomView({Key key, this.title, this.img = "btn_active.png", this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$img"),
            fit: BoxFit.fill
          )
        ),
        child: Text(title, style: AppFont.textStyle(
          14, 
          color: Colors.white, showshadow: true),),
      ),
    );
  }
}