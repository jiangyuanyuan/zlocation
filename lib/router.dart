import 'package:flutter/cupertino.dart';
import 'package:zlocation/page/GuidePage.dart';
import 'package:zlocation/root/RootPage.dart';

final routes = {
// tabbar
  '/RootPage': (context) => RootPage(),
  '/GuidePage': (context) => GuidePage()

};


var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final CupertinoPageRoute route = CupertinoPageRoute<Map<String, dynamic>>(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final CupertinoPageRoute route =
      CupertinoPageRoute<Map<String, dynamic>>(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};