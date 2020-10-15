/*
 * @Descripttion: 升级模块
 * @Author: Hades
 * @Date: 2020-10-14 21:37:54
 * @LastEditTime: 2020-10-15 11:32:45
 */

import 'package:dolphin_read/common/utils/utils.dart';
import 'package:flutter/material.dart';

class Upgrade {

  static  List<String> list =['1.更新。。。。。。','2.更新。。。。。。'];

  static init(BuildContext context){
    //请求接口
    Future.delayed(Duration.zero,(){
      showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(16),
            width: duSetWidth(600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('版本更新',style: myTextStyle(color: Colors.black,fontSize: 36.0)),
                Row(
                  children: [
                    Text('版本号:',style: myTextStyle(color: Colors.black38,fontSize: 28.0)),
                    Text('v1.0.0',style: myTextStyle(color: Colors.black38,fontSize: 22.0)),
                  ],
                ),
                Text('更新内容',style: myTextStyle(color: Colors.black54,fontSize: 30.0)),
                for(int i =0;i<list.length;i++)
                  Text('${list[i]}',style: myTextStyle(color: Colors.black54,fontSize: 30.0)),
                GestureDetector(
                  onTap: (){},
                  child:Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top:20),
                    child:  Text('更新',style: myTextStyle(color: Colors.red,fontSize: 40.0)),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        );
      });
    }); 
  }


  static TextStyle myTextStyle({color:Colors,fontSize:double}){
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: duSetFontSize(fontSize),
      decoration: TextDecoration.none
    );
  }
}
