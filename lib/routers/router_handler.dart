/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 20:36:33
 * @LastEditTime: 2020-08-03 22:15:17
 */
import 'package:dolphin_read/page/book_info/book_info_page.dart';
import 'package:dolphin_read/page/index_page.dart';
import 'package:dolphin_read/page/login/flare_sign_page.dart';
import 'package:dolphin_read/page/search/search_page.dart';
import 'package:dolphin_read/page/user_config/user_select_gender_page.dart';
import 'package:dolphin_read/page/user_config/user_select_tag_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';


//登录
Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return FlareSignPage();
  }
);
//选择性别
Handler selectGenderHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return UserSelectGenderPage();
  }
);

//标签选择
Handler selectTagsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return UserSelectTagsPage();
  }
);

//首页
Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return IndexPage();
  }
);

//搜索
Handler searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return SearchPage();
  }
);

//搜索
Handler bookInfoHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return BookInfoPage(params);
  }
);

