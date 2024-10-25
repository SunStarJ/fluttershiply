import 'dart:ffi';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_shiply_method_channel.dart';

abstract class AndroidShiplyPlatform extends PlatformInterface {
  /// Constructs a AndroidShiplyPlatform.
  AndroidShiplyPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidShiplyPlatform _instance = MethodChannelAndroidShiply();

  /// The default instance of [AndroidShiplyPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidShiply].
  static AndroidShiplyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidShiplyPlatform] when
  /// they register themselves.
  static set instance(AndroidShiplyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> initShiply(String appId, String appKey) {
    throw UnimplementedError('initShiply() has not been implemented.');
  }

  Future<String?> checkUpdate() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }
}
