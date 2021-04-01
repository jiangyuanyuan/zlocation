import 'dart:io';
import 'package:path_provider/path_provider.dart';


class CacheTool {
  ///加载缓存
  static Future<double> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      print('临时目录大小: ' + value.toString());
      return value;
    } catch (err) {
      print(err);
      return 0;
    }
  }
  /// 递归方式 计算文件的大小
  static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
            int length = await file.length();
            return double.parse(length.toString());
          }
      if (file is Directory) {
            final List<FileSystemEntity> children = file.listSync();
            double total = 0;
            if (children != null)
              for (final FileSystemEntity child in children)
                total += await _getTotalSizeOfFilesInDir(child);
            return total;
          }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  static Future<bool> clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      //此处隐藏加载loading
      
    }
  }

  ///递归方式删除目录
  static Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }
}
