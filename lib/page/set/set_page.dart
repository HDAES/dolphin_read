/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 15:28:54
 * @LastEditTime: 2020-08-14 15:29:32
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
 bool onLine = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('版本切换'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              setState(() {onLine = true;});
              HttpUtil().setbaseUrl(SERVER_API_URL);
              
            },
            leading: Checkbox(
              onChanged: (e){
                setState(() {
                  onLine = true;
                });
                HttpUtil().setbaseUrl(SERVER_API_URL);
              },
              value: onLine,
            ),
            title: Text('线上版本：http://111.229.101.168:8080'),
          ),
          ListTile(
            onTap: (){
              setState(() {onLine = false;});
              
              HttpUtil().setbaseUrl(SERVER_LOCAL_API_URL);
            },
            leading: Checkbox(
              onChanged: (e){
                setState(() {
                  onLine = false;
                });
                
               HttpUtil().setbaseUrl(SERVER_LOCAL_API_URL);
              },
              value: !onLine,
            ),
            title: Text('线下版本：http://192.168.0.2:8080'),
          )
        ],
      ),
    );
  }
}