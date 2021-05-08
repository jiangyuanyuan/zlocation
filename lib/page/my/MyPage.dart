
import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:zlocation/page/my/cell/VipCell.dart';

class MyPage extends StatefulWidget{
  @override
  _MyPageState createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            height: 40,
            width: 40,
            right: 10,
            top:32,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Image.asset("assets/xiaoxi.png", fit: BoxFit.fitHeight, height: 20,width: 20,),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset("assets/女人.png", fit: BoxFit.fitHeight, height: 70,width: 70,),
                  SizedBox(width: 30,),
                  Text("134****5678", style: AppFont.textStyle(22,color: AppColor.font333, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 5,),
              VipCell(),
            ],
          ),



        ],

      )
    );

  }

  @override

  bool get wantKeepAlive => true;
}