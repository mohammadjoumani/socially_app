import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

abstract class DeviceInfo {
  Future<String> getDeviceId();

  Future<String> getDeviceType();

  Future<String> getDeviceInfo();
}

class DeviceInfoImpl extends DeviceInfo {
  final DeviceInfoPlugin _deviceInfoPlugin;

  DeviceInfoImpl(this._deviceInfoPlugin);

  @override
  Future<String> getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? "";
    }
  }

  @override
  Future<String> getDeviceType() async {
    if (Platform.isAndroid) {
      return await _isHuaweiDevice() ? 'Huawei' : 'Android';
    }
    if (Platform.isIOS) {
      return 'Ios';
    }
    return 'Unknown';
  }

  // String getDeviceType() {
  //   return Platform.isAndroid ? "Android" : "Ios";
  // }

  @override
  Future<String> getDeviceInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return "system: Android, model: ${androidInfo.model}, device: ${androidInfo.device}";
    } else {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return "system: Ios, model: ${iosInfo.model}, systemName: ${iosInfo.systemName}, name: ${iosInfo.name}";
    }
  }

  Future<bool> _isHuaweiDevice() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.manufacturer.toLowerCase() == 'huawei';
  }
}
