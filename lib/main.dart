/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-02 22:19:29
 * @LastEditTime: 2020-08-03 20:38:50
 */
import 'package:dolphin_read/page/index_page.dart';
import 'package:dolphin_read/page/login/flare_sign_page.dart';
import 'package:dolphin_read/routers/application.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

import 'global.dart';


void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      builder: BotToastInit(),
      theme: ThemeData( 
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Global.isOfflineLogin?IndexPage():FlareSignPage(),
    );
  }
}

