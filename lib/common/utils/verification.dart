/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-10-16 16:40:39
 */

import 'package:dolphin_read/common/widgets/widgets.dart';

//账号验证
bool checkAccout(String accout){
  if(accout==null || accout.trim().isEmpty){
    Toast.show('请输入账号');
    return false;
  }
  return true;
}

//密码验证
bool checkPassWord(String pwd){
  if(pwd==null || pwd.trim().isEmpty){
    Toast.show('请输入密码');
    return false;
  }
  if(pwd.trim().length < 6 || pwd.trim().length > 20){
    Toast.show('请输入6位及以上密码');
    return false;
  }
  return true;
}

bool checkBookName(String name){
  if(name==null || name.trim().isEmpty){
    Toast.show('请输入关键字');
    return false;
  }
  return true;
}