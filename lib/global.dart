import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:flutter/material.dart';

class Global {
  /// 用户配置
  static UserModel profile = UserModel(token:null);
  /// init
  static Future init() async {
     // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    //工具初始
    await StorageUtil.init();
    // HttpUtil();
    // //获取主题颜色
    // appState.getLocalThemeColor(true);
    // // 读取离线用户信息
    // var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    //   if (_profileJSON != null) {
    //     profile = UserModel.fromJson(_profileJSON);
    //     print(profile.account.id);
    //     isOfflineLogin = true;
    //   }
    }
}