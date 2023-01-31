import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_file_attributes_method_channel.dart';

abstract class FlutterFileAttributesPlatform extends PlatformInterface {
  FlutterFileAttributesPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterFileAttributesPlatform _instance =
      MethodChannelFlutterFileAttributes();

  static FlutterFileAttributesPlatform get instance => _instance;

  static set instance(FlutterFileAttributesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map> getFileAttriburtes(String path);
}
