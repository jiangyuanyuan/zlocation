
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:permission_handler/permission_handler.dart';

class ScreenTool {
   static void _saveImage(BuildContext context ,Uint8List data) async {
    final result = await ImageGallerySaver.saveImage(data, quality: 100);
    if(result == false || result == null) {
      EasyLoading.showError("保存失败,请检查相册权限是否开启");
    } else {
      EasyLoading.showSuccess("已保存至相册");
    }
  }

  //请求权限：相册，相机，麦克风
  static void _requestPermissions() async {
    var status = await Permission.photos.status;
    if (status.isUndetermined) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
        Permission.camera,
      ].request();
    }
  }

  static void capturePng(BuildContext context, GlobalKey globalKey) async {
    _requestPermissions();
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 2);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List picBytes = byteData.buffer.asUint8List();

    _saveImage(context, picBytes);
  }

  static copy(String content) {
    if(content == null) return;
    print(content);
    Clipboard.setData(new ClipboardData(text: content));
    EasyLoading.showSuccess("success");
  }
}