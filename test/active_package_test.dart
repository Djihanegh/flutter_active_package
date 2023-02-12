import 'package:flutter_test/flutter_test.dart';
import 'package:active_package/active_package.dart';
import 'package:active_package/active_package_platform_interface.dart';
import 'package:active_package/active_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockActivePackagePlatform
    with MockPlatformInterfaceMixin
    implements ActivePackagePlatform {
  @override
  Future<String?> getActivePackageName() => Future.value('com.active_package');
}

void main() {
  final ActivePackagePlatform initialPlatform = ActivePackagePlatform.instance;

  test('$MethodChannelActivePackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelActivePackage>());
  });

  test('getPlatformVersion', () async {
    ActivePackage activePackagePlugin = ActivePackage();
    MockActivePackagePlatform fakePlatform = MockActivePackagePlatform();
    ActivePackagePlatform.instance = fakePlatform;

    expect(
        await activePackagePlugin.getActivePackageName(), 'com.active_package');
  });
}
