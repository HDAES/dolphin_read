/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-07 21:06:37
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class UserApi{
  static Future<UserModel> postLogin({@required BuildContext context,params}) async{
     var response = await HttpUtil().post(
      '/api/auth/login',
      context: context,
      params: params
    );
    StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY,response);
    Global.init();
    return UserModel.fromJson(response);
  }
}