import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_file_attributes_platform_interface.dart';

/// An implementation of [FlutterFileAttributesPlatform] that uses method channels.
class MethodChannelFlutterFileAttributes extends FlutterFileAttributesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_file_attributes');

  @override
  Future<Map> getFileAttriburtes(String path) async {
    var attributes =
        await methodChannel.invokeMethod('get_file_attributes', path);
    return attributes as Map;
  }
}
