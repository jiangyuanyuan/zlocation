
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text("我的页面"),
      ),
    );

  }

  @override

  bool get wantKeepAlive => true;
}