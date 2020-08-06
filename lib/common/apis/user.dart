import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:flutter/material.dart';

class UserApi{
  static Future<UserModel> postLogin({@required BuildContext context,params}) async{
     var response = await HttpUtil().post(
      '/api/auth/login',
      context: context,
      params: params
    );
    StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY,response);
    return UserModel.fromJson(response);
  }
}