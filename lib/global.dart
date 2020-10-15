/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-10-15 14:01:06
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:flutter/material.dart';

import 'common/utils/storage.dart';

class Global {
  /// 用户配置
  static UserModel profile = UserModel();

  static bool isOfflineLogin = false;

  ///模式   夜间 / 白天
  static bool light = true;
  static double fontSzie = 18;

  //版本
  static String version;
  //平台 ios android
  static String platform;
  
  /// init
  static Future init() async {
    
     // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    //工具初始
    await StorageUtil.init();
    //获取包的信息和软件信息
    await PackageInfoUtil.init();
    HttpUtil();
    // //获取主题颜色
    // appState.getLocalThemeColor(true);
    // // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserModel.fromJson(_profileJSON);
      isOfflineLogin = true;
    }


    ///读取用户配置
    var _light = StorageUtil().getBool('theme');
    if(_profileJSON != null) {
      light = _light;
    } 
    var _fontSzie = StorageUtil().getJSON('fontSize');
    if(_profileJSON != null) {
      fontSzie = _fontSzie;
    } 
  }
}