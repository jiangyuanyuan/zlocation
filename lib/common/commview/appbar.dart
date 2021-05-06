import 'package:flutter/material.dart';

// extension NormalAppbar on AppBar {
class NormalAppbar{
  static AppBar normal(
    {
      Widget title, 
      Widget leading, 
      Color color, 
      double elevation,
      List<Widget> actions,
      Function() onPress
  }) {
    return AppBar(
      centerTitle: true,
      title: title,
      elevation: elevation ?? 0,
      backgroundColor: color ?? Colors.white,
      actions: actions,
      leading: leading == null ? IconButton(
        padding: const EdgeInsets.all(0),
        icon: Image.asset("assets/icon_zuo.png", color: Colors.white,),
        onPressed: onPress,
      ) : leading,
    );
  }
}