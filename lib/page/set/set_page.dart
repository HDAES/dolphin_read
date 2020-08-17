/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 15:28:54
 * @LastEditTime: 2020-08-16 12:45:16
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/provider/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
 bool onLine = true;
  
  @override
  Widget build(BuildContext context) {
    var iconColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: Column(
        children: [
          Material(
            color: Theme.of(context).cardColor,
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('字体'),
                ],
              ),
              leading: Icon(
                Icons.font_download,
                color: iconColor,
              ),
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: ThemeModel.fontValueList.length,
                    itemBuilder: (context, index) {
                      var model = Provider.of<ThemeModel>(context,listen: false);
                      return RadioListTile(
                        value: index,
                        onChanged: (index) {
                          model.switchFont(index);
                        },
                        groupValue: model.fontIndex,
                        title: Text(ThemeModel.fontValueList[index]),
                      );
                    })
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ListTile(
//             onTap: (){
//               setState(() {onLine = true;});
//               HttpUtil().setbaseUrl(SERVER_API_URL);
              
//             },
//             leading: Checkbox(
//               onChanged: (e){
//                 setState(() {
//                   onLine = true;
//                 });
//                 HttpUtil().setbaseUrl(SERVER_API_URL);
//               },
//               value: onLine,
//             ),
//             title: Text('线上版本：http://111.229.101.168:8080'),
//           ),
//           ListTile(
//             onTap: (){
//               setState(() {onLine = false;});
              
//               HttpUtil().setbaseUrl(SERVER_LOCAL_API_URL);
//             },
//             leading: Checkbox(
//               onChanged: (e){
//                 setState(() {
//                   onLine = false;
//                 });
                
//                HttpUtil().setbaseUrl(SERVER_LOCAL_API_URL);
//               },
//               value: !onLine,
//             ),
//             title: Text('线下版本：http://192.168.0.2:8080'),
//           )