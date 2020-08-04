/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:14:17
 * @LastEditTime: 2020-08-03 22:30:31
 */
import 'package:dolphin_read/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:getStatusBarHeight()),
        child: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            HomePage(),
            Text('2'),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
        ],
        style: TabStyle.fixedCircle,
        initialActiveIndex: 1,//optional, default as 0
        onTap: (int i){
          setState(() {
            i==0?currentIndex=0:currentIndex=1;
          });
        },
      )
    );
  }
}