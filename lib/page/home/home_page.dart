/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:24:01
 * @LastEditTime: 2020-08-03 22:24:40
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/page/home/home_banner.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  TabController _controller;
  List<Tab> tabs = [
    Tab(text: '推荐'),
    Tab(text: '男生'),
    Tab(text: '女生'),
    Tab(text: '出版')
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LightTheme(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: tabs,
            controller: _controller,
            indicatorColor: Color(0xFF33C3A5),
            labelColor: Color(0xFF33C3A5),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 16),
          )
        ),
        body: Container(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              Container(
                child: Text('1'),
              ),
              Container(
                child: Text('1'),
              ),
              Container(
                child: Text('1'),
              ),Container(
                child: Text('1'),
              )
            
            ],
          ),
        ),
      ),
    );
    // Column(
    //   children: <Widget>[
    //     Container(
    //       height: NormalValue.appbarHight,
    //       padding: NormalValue.paddinglr_10,
    //       child: Row(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               GestureDetector(
    //                 onTap: (){setState(() {
    //                   currentIndex=0;
    //                 });},
    //                 child: Container(
    //                   padding: EdgeInsets.only(left:duSetWidth(30),right:duSetWidth(30),top:duSetWidth(5),bottom:duSetWidth(5)),
    //                   child: Row(
    //                     children: <Widget>[
    //                       Icon(
    //                         IconData(0xe608,fontFamily: 'CustomIcon'),
    //                         color:currentIndex==0?Colors.white:ColorsUtil.hexToColor('#448AFF'),
    //                         size: duSetFontSize(50),
    //                       ),
    //                       Text('男频',style: TextStyle(color: currentIndex==0?Colors.white:ColorsUtil.hexToColor('#448AFF')))
    //                     ],
    //                   ),
    //                   decoration: BoxDecoration(
    //                     color: currentIndex==0?ColorsUtil.hexToColor('#448AFF'):Colors.white,
    //                     border: Border.all(width: 1,color: ColorsUtil.hexToColor('#448AFF')),
    //                     borderRadius: BorderRadius.circular(10)
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(width: duSetWidth(20)),
    //               GestureDetector(
    //                 onTap: (){setState(() {
    //                   currentIndex=1;
    //                 });},
    //                 child: Row(
    //                   children: <Widget>[
    //                     Container(
    //                       padding: EdgeInsets.only(left:duSetWidth(30),right:duSetWidth(30),top:duSetWidth(5),bottom:duSetWidth(5)),
    //                       child: Row(
    //                         children: <Widget>[
    //                           Icon(
    //                             IconData(0xe611,fontFamily: 'CustomIcon'),
    //                             color:currentIndex==1?Colors.white:ColorsUtil.hexToColor('#FF5252'),
    //                             size: duSetFontSize(50),
    //                           ),
    //                           Text('女频',style: TextStyle(color: currentIndex==1?Colors.white:ColorsUtil.hexToColor('#FF5252')))
    //                         ],
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: currentIndex==0?Colors.white:ColorsUtil.hexToColor('#FF5252'),
    //                         border: Border.all(width: 1,color: ColorsUtil.hexToColor('#FF5252')),
    //                         borderRadius: BorderRadius.circular(10)
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Expanded(
    //       child: FutureBuilder(
    //         future: getBanner(context),
    //         builder: (BuildContext context, AsyncSnapshot snapshot){
    //           if (snapshot.hasData) {
    //             return EasyRefresh(
    //               header: MaterialHeader(),
    //               onRefresh: () async {
    //                 await Future.delayed(Duration(seconds: 2), () {
    //                   if (mounted) {
    //                     setState(() {
    //                       _count = 20;
    //                     });
    //                   }
    //                 });
    //               },
    //               child: ListView(
    //                 children: <Widget>[
    //                   HomeBanner(),
    //                 ],
    //               ),
    //             );
    //           }else{
    //             return SampleListItem(number:8);
    //           }
    //         },
    //       ),
    //     )
    //   ],
    // );
  }
  Future getBanner(context) async{
    return  IndexApi.getIndexBanner(context: null);
  }
}

