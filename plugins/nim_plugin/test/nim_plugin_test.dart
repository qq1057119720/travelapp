import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nim_plugin/nim_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('nim_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Nim.platformVersion, '42');
  });
}
