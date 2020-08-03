import 'package:dolphin_read/page/login/flare_sign_page.dart';
import 'package:dolphin_read/page/user_config/user_select_gender_page.dart';
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