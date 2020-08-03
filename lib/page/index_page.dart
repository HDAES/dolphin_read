/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:14:17
 * @LastEditTime: 2020-08-03 22:30:31
 */
import 'package:flutter/material.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
        ],
        style: TabStyle.fixedCircle,
        initialActiveIndex: 1,//optional, default as 0
        onTap: (int i) => print('click index=$i'),
      )
    );
  }
}