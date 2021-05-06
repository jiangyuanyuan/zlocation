import 'package:flutter/material.dart';
import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';

class FriendCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 139,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.only(left: 15,right: 15,top: 12,bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
              blurRadius: 2, //阴影范围
              spreadRadius: 2, //阴影浓度
              color: AppColor.bgsk, //阴影颜色
            ),
          ],
          borderRadius: BorderRadius.circular(10), // 圆角也可控件一边圆角大小
          //borderRadius: BorderRadius.only(
          //  topRight: Radius.circular(10),
          // bottomRight: Radius.circular(10)) //单独加某一边圆角
        ),
      child: Column(

        children: [
          Row(
            children: [
              Image.asset("assets/女人.png", fit: BoxFit.fitHeight, height: 50,width: 50,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("细雨点洒在花前", style: AppFont.textStyle(16,color: AppColor.font333, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("最后位置：广东省深圳市南山区粤海街道高新…",style: AppFont.textStyle(12,color: AppColor.font666),),
                  SizedBox(height: 5,),
                  Text("更新时间：2020-12-22 10:00",style: AppFont.textStyle(12,color: AppColor.font666),),
                ],
              )

            ],

          ),
          SizedBox(height: 10,),
          Divider(
            height: 1.0,indent: 15.0,color: AppColor.line,
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("查看轨迹",style: AppFont.textStyle(14,color: AppColor.font333),textAlign: TextAlign.center,),
              Text("地点提醒",style: AppFont.textStyle(14,color: AppColor.font333),textAlign: TextAlign.center,),
              Text("更多",style: AppFont.textStyle(14,color: AppColor.font333),textAlign: TextAlign.center,),
            ],
          )
        ],
      )
    );
  }

}