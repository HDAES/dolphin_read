/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:14:17
 * @LastEditTime: 2020-08-03 22:30:31
 */
import 'package:dolphin_read/page/home/home_page.dart';
import 'package:dolphin_read/page/me/me_page.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750, height: 1334);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomePage(),
          MePage() 
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.supervisor_account, title: 'me'),
        ],
        style: TabStyle.fixedCircle,
        initialActiveIndex: 1,//optional, default as 0
        onTap: (int i){
          if(i==1){
            Routes.navigateTo(context, Routes.search);
          }
          setState(() {
            i==0?currentIndex=0:currentIndex=1;
          });
        },
      )
    );
  }
}