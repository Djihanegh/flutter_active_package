import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'active_package_platform_interface.dart';

/// An implementation of [ActivePackagePlatform] that uses method channels.
class MethodChannelActivePackage extends ActivePackagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('active_package');

  @override
  Future<String?> getActivePackageName() async {
    String? packageName;

    try {
      final result =
          await methodChannel.invokeMethod<String>('getActivePackageName');
      return result;
    } on PlatformException catch (e) {
      packageName = "";
    }

    return packageName;
  }
}
