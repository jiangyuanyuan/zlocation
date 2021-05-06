import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class CustiomMenuView extends StatelessWidget {
  final Widget child;
  final List<String> titles;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function(int index, String val) onSelected;

  const CustiomMenuView({
    Key key, 
    this.backgroundColor = AppColor.f9f9f9, 
    @required this.titles, 
    this.onSelected, 
    @required this.child,
    this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      child: child,
      items: titles,
      topDivider: true,
      itemBuilder: (value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
        child: Text(value, style: textStyle ?? AppFont.textStyle(14, color: AppColor.font333),),
      ),
      toggledChild: Container(
        color: backgroundColor,
        child: child,
      ),
      divider: Container(),
      onItemSelected: (value) {
        if(onSelected != null) {
          onSelected(titles.indexOf(value), value);
        }
      },
      decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor
      ),
      onMenuButtonToggle: (isToggle) {
      },
    );
  }
}