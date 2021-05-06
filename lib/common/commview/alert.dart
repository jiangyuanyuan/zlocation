import "package:zlocation/common/commview/btn_image_bottom.dart";
import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zlocation/i18/i18n.dart';

class Alert {
  /// 简单提示
  static  showToast(String msg) {
    EasyLoading.showToast(msg);
  }


  /// 选择弹窗
  static showBottomDialog(BuildContext context, List<String> titles,{Function(int index) onTapIndex}) {
    final size = MediaQuery.of(context).size;

    List<Widget> list = [];
    for (var i = 0; i < titles.length; i++) {
      // Widget wid = GestureDetector(
      //               onTap: (){
      //                 if(onTapIndex != null) onTapIndex(i);
      //               },
      //               child: Container(
      //                 color: Colors.white,
      //                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //                 alignment: Alignment.center,
      //                 child: Text(titles[i], style: AppFont.textStyle(14, color: AppColor.font333),)
      //               ),
      //             );
      final wid = BtnImageBottomView(
        title: titles[i],
        onTap: () {
          Navigator.pop(context);
          onTapIndex(i);
        },
      );
      list.add(wid);
      if(i != titles.length - 1)list.add(Divider(height: 0.5,endIndent: 42, indent: 42,));
    }

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: list
                  ),
                ),
                // GestureDetector(
                //   onTap: () => Navigator.of(context).pop(),
                //   child: Container(
                //     width: size.width - 50,
                //     padding: const EdgeInsets.symmetric(vertical: 8.5),
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.white,
                //     ),
                //     child: Text("取消", style: AppFont.textStyle(14, color: AppColor.font333),)
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BtnImageBottomView(
                    title: "取消",
                    onTap: () => Navigator.pop(context),
                    img: "btn_inactive.png",
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        );
      }
    );
  } 


    // 提示确认框，确定取消
  static Future<bool> showConfirmDialog(
    BuildContext context,
    {
      String title = "提示\是否确认",
      String cancel = "取消",
      String sure = "确认",
      Function sureCallback
    }
    ) {
    _currTextStyle(double fontsize, Color color, FontWeight fontWeight) {
      return TextStyle(
                        color: color,
                         fontSize: fontsize,
                         decoration: TextDecoration.none, fontWeight: fontWeight);
    }

    Widget _createBtn(String title, Function action, Color color) {
      return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 11),
            child: Text(title,style: _currTextStyle(14, color, FontWeight.w300),),
          ),
          onTap: (){
            Navigator.of(context).pop(true);
            if(action != null) action();
          },
        ),
      );
    }

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            margin: const EdgeInsets.only(left: 80, right: 80),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(23),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                     style: _currTextStyle(15, AppColor.font333, FontWeight.w400)
                    ),
                ),
                Divider(height: 0.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _createBtn(I18n.of(context).cancel, null, const Color(0xff999999)),
                    Container(width: 0.5 ,height: 25,color: AppColor.divigrey),
                    _createBtn(I18n.of(context).sure, sureCallback, AppColor.blue)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }



  /// 提示确认框，确定
  static showMsgDialog(BuildContext context, {bool barrierDismissible = false, bool iswillpop = true, String msg, String title = "提示", Function callback}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible, //点击遮罩不关闭对话框
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => iswillpop,
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            actionsPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(title, style: AppFont.textStyle(15, color: AppColor.font333, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(msg, textAlign: TextAlign.center, style: AppFont.textStyle(15, color: AppColor.font333)),
                  ),
                  Divider(height: 1,indent: 12,endIndent: 12,),
                  InkWell(
                    onTap: (){
                      if(iswillpop) Navigator.pop(context);
                      if(callback != null) callback();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(I18n.of(context).sure, style: AppFont.textStyle(15, color: AppColor.blue)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  } 



  // 用户信息
  static showBottomViewDialog(BuildContext context, Widget child,{double evelvation}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      elevation: evelvation,
      builder: (context) {
        return child;
      }
    );
  } 

  static showViewDialog(BuildContext context, Widget child, {bool barrierDimissble = false}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDimissble, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: child,
        );
      }
    );
  }
}