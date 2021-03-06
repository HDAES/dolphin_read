/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 20:36:33
 * @LastEditTime: 2020-10-14 20:58:59
 */
import 'package:dolphin_read/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:dolphin_read/routers/router_handler.dart';

class Routes {
  static Router router;

  static String login = '/login';
  static String selectGender = '/selectGender';
  static String selectTags = '/selectTags';
  static String index = '/index';
  static String search = '/search';
  static String bookInfo = '/bookInfo';
  static String book = '/book';
  static String version ='/version';
  static String setSystem ='/set';
  static String follow = '/follow';

   static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return ;
      }
    );

    router.define(login, handler: loginHandler);
    router.define(selectGender, handler: selectGenderHandler);   //选择性别
    router.define(selectTags, handler: selectTagsHandler);   //选择性别
    router.define(index, handler: indexHandler);   //选择性别
    router.define(search, handler: searchHandler);   //选择性别
    router.define(bookInfo, handler: bookInfoHandler);   //选择性别
    router.define(book, handler: bookHandler); 
    router.define(version, handler: versionHandler);
    router.define(setSystem, handler: setHandler);
    router.define(follow, handler: followHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native,bool clear = false}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key].toString());
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    if(query!='') //print('我是navigateTo传递的参数：$query');
    

    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition,clearStack: clear);
  }
}