import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'appbar.dart';

class WebviewPage extends StatelessWidget {
  final Map params;

  const WebviewPage({Key key, this.params}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar.normal(
        title: Text("${params['title'] ?? '网页'}"),
        onPress: () => Navigator.pop(context)
      ),
      body: WebView(
        params['url'],
        aspectRatio: 1,
      ),
    );
  }
}