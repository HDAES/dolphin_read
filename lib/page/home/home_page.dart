/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:24:01
 * @LastEditTime: 2020-08-17 21:07:48
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/page/home/recommend_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  int currentIndex = 0;

  TabController _controller;
  List<Tab> tabs = [
    Tab(text: '推荐'),
    Tab(text: '男生')
  ];

  @override
  bool get wantKeepAlive => true;
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
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: tabs,
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 16),
          )
        ),
        body: Container(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              RecommendPage(),
              Container(
                child: Text('1'),
              )
            ],
          ),
        ),
      );
   
  }
  Future getBanner(context) async{
    return  IndexApi.getIndexBanner(context: null);
  }
}

