import 'flutter_file_attributes_platform_interface.dart';

class FlutterFileAttributes {
  Future<Map> getFileAttriburtes(String path) {
    return FlutterFileAttributesPlatform.instance.getFileAttriburtes(path);
  }
}
