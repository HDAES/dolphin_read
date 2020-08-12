import 'package:awesome_dialog/awesome_dialog.dart';

class DialogWidget {
  
  static showSuccess(context,{int code,String title,String desc}){

    DialogType _dialogType;
    switch(code){
      case 200 :
        _dialogType = DialogType.SUCCES;
        break;
      case 400 :
        _dialogType = DialogType.INFO;
        break;
      case 500 :
        _dialogType = DialogType.ERROR;
        break;
      default :
        _dialogType = DialogType.SUCCES;
        break;
    }
    return AwesomeDialog(
      context: context,
      dialogType: _dialogType,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }

}