import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_shiply_platform_interface.dart';

/// An implementation of [AndroidShiplyPlatform] that uses method channels.
class MethodChannelAndroidShiply extends AndroidShiplyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_shiply');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> checkUpdate() async {
    return await methodChannel.invokeMethod<String>('checkUpdate');
  }

  @override
  Future<int?> initShiply(String appId, String appKey) async {
    int? resultData = null;
    final result = await methodChannel
        .invokeMethod<int>('initShiply', {'appId': appId, 'appKey': appKey});
    try {
      resultData = result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return resultData;
  }
}
