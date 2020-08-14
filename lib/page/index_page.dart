/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:14:17
 * @LastEditTime: 2020-08-14 16:24:38
 */
import 'package:dolphin_read/common/widgets/fluid_nav_bar/fluid_nav_bar.dart';
import 'package:dolphin_read/page/bookshelf/bookshelf_page.dart';
import 'package:dolphin_read/page/home/home_page.dart';
import 'package:dolphin_read/page/me/me_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Widget _child;
  @override
  void initState() {
     _child = HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750, height: 1334);
    return Scaffold(
      body: _child,
      bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = BookShelfPage();
          break;
        case 1:
          _child = HomePage();
          break;
        case 2:
          _child = MePage();
          break;
        
      }
      _child = AnimatedSwitcher(
        
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,);
    });
  }
}