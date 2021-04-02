
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget{
  @override
  _LocationPageState createState() {
    return _LocationPageState();
  }
}

class _LocationPageState extends State<LocationPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("定位页面"),
      ),
    );

  }
}