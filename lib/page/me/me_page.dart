import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){Routes.navigateTo(context, Routes.history);},
            focusColor: Colors.yellow,
            title: Text('历史记录'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: (){Routes.navigateTo(context, Routes.version);},
            focusColor: Colors.yellow,
            title: Text('版本切换'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
      
    );
  }
}