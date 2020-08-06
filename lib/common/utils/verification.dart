
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