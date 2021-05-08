import 'package:flutter/material.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:zlocation/i18/i18n.dart';

class MineActionView extends StatelessWidget {
  // static const List<String> titles = [
  //   "我的背包",
  //   "充值",
  //   "提现",
  //   "邀请好友"
  // ];
  static const List<String> imgs = [
    "实时位置.png",
    "历史轨迹.png",
    "一键求助.png",
    "永久保存.png"
  ];
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "实时位置",
      "历史轨迹",
      "一键求助",
      "永久保存",
    ];
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: titles.map((e) => InkWell(
            onTap: () => _jump(context, titles.indexOf(e)),
            child: _DetailView(img: imgs[titles.indexOf(e)], titles: e,))).toList(),
      ),
    );
  }

  void _jump(BuildContext context, int status) {
    switch (status) {
      case 0:
        Navigator.pushNamed(context, "/package");
        break;
      case 1:
        Navigator.pushNamed(context, '/recharge');
        break;
      case 2:
        Navigator.pushNamed(context, '/reflect');
        break;
      default:
      // Navigator.pushNamed(context, "/invite");
        Navigator.pushNamed(context, "/reel");

    }
  }
}

class _DetailView extends StatelessWidget {
  final String img;
  final String titles;

  const _DetailView({Key key, this.img, this.titles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/$img"),
        SizedBox(height: 8,),
        Text(titles, style: AppFont.textStyle(12, color: AppColor.font5C3F2E),)
      ],
    );
  }
}