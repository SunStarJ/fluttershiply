
import 'android_shiply_platform_interface.dart';

class AndroidShiply {
  Future<String?> getPlatformVersion() {
    return AndroidShiplyPlatform.instance.getPlatformVersion();
  }
  Future<String?> checkUpdate() {
    return AndroidShiplyPlatform.instance.checkUpdate();
  }
  Future<int?> initShiply(String appId, String appKey) {
    return AndroidShiplyPlatform.instance.initShiply(appId, appKey);
  }
}
