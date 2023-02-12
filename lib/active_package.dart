import 'active_package_platform_interface.dart';

class ActivePackage {
  Future<String?> getActivePackageName() {
    return ActivePackagePlatform.instance.getActivePackageName();
  }
}
