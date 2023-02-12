import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:active_package/active_package_method_channel.dart';

void main() {
  MethodChannelActivePackage platform = MethodChannelActivePackage();
  const MethodChannel channel = MethodChannel('active_package');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'com.active_package';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getActivePackageName', () async {
    expect(await platform.getActivePackageName(), 'com.active_package');
  });
}
