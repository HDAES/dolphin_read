/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-10-15 13:56:30
 */
import 'dart:core';
import 'package:bot_toast/bot_toast.dart';

class Toast{
  static show(String msg){
    BotToast.showText(text: msg);
  } 
}

