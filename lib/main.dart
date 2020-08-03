/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-02 22:19:29
 * @LastEditTime: 2020-08-02 22:51:15
 */
import 'package:dolphin_read/page/login/flare_sign_page.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      theme: ThemeData( 
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlareSignPage(),
    );
  }
}

