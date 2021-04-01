import 'package:install_plugin/install_plugin.dart';
class ToolAPK {
  /// 安装apk
  static Future<Null> installApk(String url) async {

    InstallPlugin.installApk(url, "com.example.migo")
        .then((result) {
      print('install apk $result');
    }).catchError((error) {
      print('install apk error: $error');
    });
  }
}