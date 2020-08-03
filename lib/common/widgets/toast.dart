import 'package:bot_toast/bot_toast.dart';

class Toast{
  static show(String msg){
    BotToast.showText(text: msg);
   }
}