import 'package:animated_interpolation/smart_tabbar.dart';
import 'package:animated_interpolation/sweet_indicator_painter.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';

class SelectTabView extends StatelessWidget {
  
  final TabController tabController;
  final List<String> titles;
  final int currentIndex;
  final Function(int index) onTap;
  final double paddingTop;
  final double indicatorHeight;
  final EdgeInsets indicatorPadding;
  final bool isscroll;

  final Color color;
  final Color activeColor;
  final double activeFontSize;
  final double fontSize;

  const SelectTabView({
    Key key, 
    @required this.tabController, 
    @required this.titles, 
    this.currentIndex, 
    this.onTap,
    this.paddingTop = 15,
    this.fontSize = 15,
    this.isscroll = true,
    this.activeFontSize = 15,
    this.indicatorHeight = 2,
    this.indicatorPadding = EdgeInsets.zero,
    this.color = AppColor.fontgrey,
    this.activeColor = AppColor.blue
  }) : super(key: key);

  TextStyle normalStyle(int index) {
    return index == currentIndex 
    ? AppFont.textStyle(activeFontSize, color: activeColor, fontWeight: FontWeight.bold)
    : AppFont.textStyle(fontSize, color: color);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 44,
      margin: EdgeInsets.only(top: paddingTop),
      child: SmartTabBar(
        labelColor: color,
        isScrollable: isscroll,
        controller: tabController,
        indicatorWeight: indicatorHeight,
        indicatorPadding: indicatorPadding,
        indicatorColor: activeColor,
        indicatorBuilder: (context,controller,indicator,indicatorSize,tabKeys,old)=>SweetIndicatorPainter(
          controller: controller,
          indicatorSize: indicatorSize,
          indicator: indicator,
          tabKeys: tabKeys,
          old: old
        ),
        tabs: titles.map((e) => Text(e, style: normalStyle(titles.indexOf(e)))).toList(),
        onTap: onTap,
      ),
    );
  }
}