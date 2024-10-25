import 'package:flutter_test/flutter_test.dart';
import 'package:android_shiply/android_shiply.dart';
import 'package:android_shiply/android_shiply_platform_interface.dart';
import 'package:android_shiply/android_shiply_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAndroidShiplyPlatform
//     with MockPlatformInterfaceMixin
//     implements AndroidShiplyPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final AndroidShiplyPlatform initialPlatform = AndroidShiplyPlatform.instance;
//
//   test('$MethodChannelAndroidShiply is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAndroidShiply>());
//   });
//
//   test('getPlatformVersion', () async {
//     AndroidShiply androidShiplyPlugin = AndroidShiply();
//     MockAndroidShiplyPlatform fakePlatform = MockAndroidShiplyPlatform();
//     AndroidShiplyPlatform.instance = fakePlatform;
//
//     expect(await androidShiplyPlugin.getPlatformVersion(), '42');
//   });
// }
