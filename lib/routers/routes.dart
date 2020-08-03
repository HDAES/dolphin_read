import 'package:dolphin_read/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:dolphin_read/routers/router_handler.dart';

class Routes {
  static Router router;

  static String selectGender = '/selectGender';

   static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return ;
      }
    );

    router.define(selectGender, handler: selectGenderHandler);   //选择性别
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    if(query!='') print('我是navigateTo传递的参数：$query');
    

    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition);
  }
}