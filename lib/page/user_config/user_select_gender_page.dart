/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 21:05:51
 * @LastEditTime: 2020-08-17 21:17:04
 */
/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 20:36:33
 * @LastEditTime: 2020-08-14 18:10:54
 */

import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserSelectGenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: <Widget>[
          Positioned(
            top:getStatusBarHeight()+10,
            right: 10,
            child: GestureDetector(
              onTap: ()=>{Routes.navigateTo(context, Routes.selectTags)},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('跳过',style: TextStyle(fontSize: duSetFontSize(36),color: Colors.black)),
                  Icon(Icons.arrow_forward,color: Colors.black)
                ],
              ),
            ),
          ),
          Positioned(
            top:duSetHeight(200),
            left: duSetWidth(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('请选择您的性别',style: TextStyle(fontSize: duSetFontSize(42),color: Colors.black54)),
                Text('根据性别为您推荐最合适的书籍',
                  style: TextStyle(fontSize: duSetFontSize(28),color: Colors.black45,height: 2)
                ),
                Padding(
                  padding: EdgeInsets.only(top:duSetHeight(200)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Routes.navigateTo(context, Routes.selectTags);
                        },
                        child: Icon(
                          IconFonts.male,
                          color: ColorsUtil.hexToColor('#448AFF'),
                          size: duSetFontSize(180),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:duSetWidth(100)),
                        child: GestureDetector(
                          onTap: (){
                            Routes.navigateTo(context, Routes.selectTags);
                          },
                          child: Icon(
                            IconFonts.female,
                            color: ColorsUtil.hexToColor('#FF5252'),
                            size: duSetFontSize(180),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}