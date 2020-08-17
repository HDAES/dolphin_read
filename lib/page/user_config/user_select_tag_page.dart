/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 20:36:33
 * @LastEditTime: 2020-08-17 21:31:25
 */

import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/toast.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class UserSelectTagsPage extends StatefulWidget {
  @override
  _UserSelectTagsPageState createState() => _UserSelectTagsPageState();
}

class _UserSelectTagsPageState extends State<UserSelectTagsPage> {



  List<Map> manTags =[{
   "id":1,"text":'都市',"isSelect":false},{
   "id":2,"text":'玄幻',"isSelect":false},{
   "id":3,"text":'仙侠',"isSelect":false},{
   "id":4,"text":'游戏',"isSelect":false},{
   "id":5,"text":'历史',"isSelect":false},{
   "id":6,"text":'科幻',"isSelect":false},{
   "id":7,"text":'奇幻',"isSelect":false},{
   "id":8,"text":'武侠',"isSelect":false},{
   "id":9,"text":'职场',"isSelect":false},{
   "id":9,"text":'军事',"isSelect":false},{
   "id":9,"text":'竞技',"isSelect":false},{
   "id":9,"text":'灵异',"isSelect":false},{
   "id":9,"text":'轻小',"isSelect":false},{
   "id":9,"text":'同人',"isSelect":false}
   ];

   List<Map> womanTags =[{
   "id":1,"text":'古代言情',"isSelect":false},{
   "id":2,"text":'青春校园',"isSelect":false},{
   "id":3,"text":'纯爱',"isSelect":false},{
   "id":4,"text":'武侠仙侠',"isSelect":false},{
   "id":5,"text":'科幻',"isSelect":false},{
   "id":6,"text":'玄幻奇幻',"isSelect":false},{
   "id":7,"text":'悬疑灵异',"isSelect":false},{
   "id":8,"text":'同人',"isSelect":false},{
   "id":9,"text":'女尊',"isSelect":false},{
   "id":9,"text":'莉莉',"isSelect":false},{
   "id":9,"text":'游戏竞技',"isSelect":false}
   ];




  @override
  void initState() {
    super.initState();
  }








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
              onTap: ()=>{Routes.navigateTo(context, Routes.index)},
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
            width: duSetWidth(650),
            left: duSetWidth(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('选择您的阅读偏好',style: TextStyle(fontSize: duSetFontSize(48),color: Colors.black87,fontWeight: FontWeight.bold)),
                    Text('(最多选择5个)',style: TextStyle(fontSize: duSetFontSize(28),color: Colors.black45))
                  ],
                ),
                Text('让我们更好的为您服务',
                  style: TextStyle(fontSize: duSetFontSize(28),color: Colors.black45,height: 2)
                ),
                Container(
                  width: duSetWidth(650),
                  margin: EdgeInsets.only(top:duSetHeight(50)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            IconFonts.male,
                            color: ColorsUtil.hexToColor('#448AFF'),
                            size: duSetFontSize(40),
                          ),
                          SizedBox(width: duSetWidth(10)),
                          Text('男生爱看',style: TextStyle( color: ColorsUtil.hexToColor('#448AFF')))
                        ],
                      ),
                      SizedBox(height: duSetHeight(20)),
                      Wrap(
                        spacing: 5, 
                        children:manTags.map((item){
                          return ChoiceChip(
                              label: Text(item['text'],style: TextStyle(color: Colors.white)), 
                              selected: item['isSelect'],
                              backgroundColor: Colors.grey[400],
                              selectedColor:  strToColor(item['text']),
                              onSelected: (bool isCheck){ setState(() {
                                item['isSelect'] = isCheck;
                                isCheck?Toast.show("已选择:${item['text']}"):Toast.show("已取消:${item['text']}");
                              });},
                            );
                        }).toList()
                      )
                    ],
                  ),
                ),
                Container(
                  width: duSetWidth(650),
                  margin: EdgeInsets.only(top:duSetHeight(50)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            IconFonts.female, 
                            color: ColorsUtil.hexToColor('#FF5252'),
                            size: duSetFontSize(40),
                          ),
                          SizedBox(width: duSetWidth(10)),
                          Text('女生爱看',style: TextStyle( color: ColorsUtil.hexToColor('#FF5252')))
                        ],
                      ),
                      SizedBox(height: duSetHeight(20)),
                      Wrap(
                        spacing: 5, 
                        children:womanTags.map((item){
                          return ChoiceChip(
                              label: Text(item['text'],style: TextStyle(color: Colors.white)), 
                              selected: item['isSelect'],
                              backgroundColor: Colors.grey[400],
                              selectedColor:  strToColor(item['text']),
                              onSelected: (bool isCheck){ setState(() {
                                item['isSelect'] = isCheck;
                                isCheck?Toast.show("已选择:${item['text']}"):Toast.show("已取消:${item['text']}");
                              });},
                            );
                        }).toList()
                      )
                    ],
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){Toast.show('完成设置');Routes.navigateTo(context, Routes.index,clear: true);},
                    child:Container(
                      margin: EdgeInsets.only(top:duSetHeight(50)),
                      padding: EdgeInsets.only(top:duSetWidth(30),bottom:duSetWidth(30),left:duSetWidth(60),right:duSetWidth(60) ),
                      child: Text('开始阅读之旅',style: TextStyle(color: Colors.white)),
                      decoration: BoxDecoration(
                        color: ColorsUtil.hexToColor('#33C3A5'),
                        borderRadius: BorderRadius.circular(25)
                      ),
                    ),
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

  Color strToColor(String string) {
    assert(string.length > 1);
    final int hash = string.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }