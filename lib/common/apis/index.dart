/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-08-14 14:25:46
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/model/index.dart';
import 'package:dolphin_read/model/index_banner.dart';
import 'package:flutter/material.dart';

class  IndexApi {
  static Future<IndexBanner> getIndexBanner({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/api/novel/index/rotation',
      context: context
    );
    return IndexBanner.fromJson(response);
  }


  static Future<IndexModel> getIndex({@required BuildContext context,params,refresh}) async{
     var response = await HttpUtil().get(
      '/api/index/novel',
      context: context,
      params: params,
      refresh: refresh
    );
    return IndexModel.fromJson(response);
  }
 

}