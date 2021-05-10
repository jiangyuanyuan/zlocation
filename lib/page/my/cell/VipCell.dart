

import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';

import 'MineActionView.dart';

class VipCell extends StatefulWidget {
  final Map params;

  const VipCell({Key key, this.params}) : super(key: key);
  @override
  _VipCellState createState() => _VipCellState();
}

class _VipCellState extends State<VipCell> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(15),
      //设置背景图片
      decoration: new BoxDecoration(

        image: new DecorationImage(
          image: new AssetImage("assets/vip背景图片.png"),
          //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // fit: StackFit.expand,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.only(left: 20,top: 15),
                child: Text("尊享超级VIP",style: AppFont.textStyle(16, color: AppColor.font5C3F2E, fontWeight: FontWeight.bold),),

              ),
              Positioned(
                right: 20,
                top: 15,
                child:InkWell(

                    child: Container(
                      width: 90,
                      decoration: new BoxDecoration(
                        color: AppColor.font3D3732,
                        border: new Border.all(width: 2.0, color: AppColor.font3D3732),
                        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                      ),
                      alignment: Alignment.center,
                      padding:EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
                      child: Text("立即开通",style: AppFont.textStyle(14, color: AppColor.fontE9D1BB, fontWeight: FontWeight.bold),),
                    ),
                    onTap: () {

                    }
                ),

              ),
            ],
          ),

          MineActionView(),


        ],
      ),
    );

  }
}
