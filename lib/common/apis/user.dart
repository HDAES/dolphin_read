/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-18 16:53:41
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/model/follows.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:dolphin_read/model/user_history.dart';
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

  //历史记录
  static Future<UserHistoryModel> getHistory({@required BuildContext context,params,refresh}) async{
     print("===========历史记录$params=============");
     var response = await HttpUtil().get(
      '/api/user/book/history',
      context: context,
      params: params,
      refresh: refresh
    );
    return UserHistoryModel.fromJson(response);
  }

  //收藏书籍
  static Future postFollow({@required BuildContext context,params}) async{
     var response = await HttpUtil().post(
      '/api/follow/book',
      context: context,
      params: params,
      refresh: true
    );
    return response;
  }

  //获取收藏书籍
  static Future<FollowsModel> getFollow({@required BuildContext context}) async{
     print("===========获取收藏书籍=============");
     var response = await HttpUtil().get(
      '/api/user/follow',
      context: context,
      refresh: true
    );
    return FollowsModel.fromJson(response);
  }
}