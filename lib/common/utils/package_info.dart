/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-10-15 11:38:33
 * @LastEditTime: 2020-10-15 14:02:59
 */
import 'dart:io';

import 'package:dolphin_read/global.dart';
import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
class PackageInfoUtil {
  static PackageInfo packageInfo;
  static String platform;
  static Future<void> init() async {
    if (packageInfo == null) {
      packageInfo =  await PackageInfo.fromPlatform();
      Global.version = packageInfo.version;
    }

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      
    if(Platform.isAndroid){
      platform = 'android';
      Global.platform = 'android';
      //android相关代码
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
      print('Running on ${androidInfo.device}');
    }else if(Platform.isIOS){
      platform = 'ios';
      Global.platform = 'ios';
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}'); 
      print('Running on ${iosInfo.systemVersion}');
    }
  }

  
}