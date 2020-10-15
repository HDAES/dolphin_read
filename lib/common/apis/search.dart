/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-10-15 13:56:22
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/toast.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/search.dart';
import 'package:flutter/material.dart';


class SearchApi{
  static Future<SearchMode> getSearch({@required BuildContext context,params}) async{
    print(params);
    var response = await HttpUtil().get(
      '/api/search/book/name',
      context: context,
      params: params,
      refresh: true
    );
    print(response);
    return SearchMode.fromJson(response);
  }

  //调取爬虫接口
  static Future postCrawlingNovels({@required BuildContext context,params}) async{
    print(params);
    var response = await HttpUtil().post(
      '/api/crawling/novels',
      context: context,
      params: params
    );

    
    print(response);
    Toast.show(response['message']);

    return response;
  }
}