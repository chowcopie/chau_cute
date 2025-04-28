import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceUtils {
  DeviceUtils._();

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    Map<String, dynamic> deviceInfo = {};
    if (kIsWeb) {
      deviceInfo = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {
      deviceInfo = switch (defaultTargetPlatform) {
        TargetPlatform.android => _readAndroidBuildData(
          await deviceInfoPlugin.androidInfo,
        ),
        TargetPlatform.iOS => _readIosDeviceInfo(
          await deviceInfoPlugin.iosInfo,
        ),
        _ => {},
      };
    }

    return deviceInfo;
  }

  static Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': data.browserName.name,
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'hardwareConcurrency': data.hardwareConcurrency,
    };
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.codename': build.version.codename,
      'board': build.board,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'hardware': build.hardware,
      'host': build.host,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'isLowRamDevice': build.isLowRamDevice,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
