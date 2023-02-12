import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'active_package_method_channel.dart';

abstract class ActivePackagePlatform extends PlatformInterface {
  /// Constructs a ActivePackagePlatform.
  ActivePackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static ActivePackagePlatform _instance = MethodChannelActivePackage();

  /// The default instance of [ActivePackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelActivePackage].
  static ActivePackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ActivePackagePlatform] when
  /// they register themselves.
  static set instance(ActivePackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getActivePackageName();
}
