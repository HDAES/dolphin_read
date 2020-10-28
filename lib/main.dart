/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-02 22:19:29
 * @LastEditTime: 2020-10-28 13:23:56
 */
import 'package:dolphin_read/page/index_page.dart';
import 'package:dolphin_read/page/login/flare_sign_page.dart';
import 'package:dolphin_read/provider/providers.dart';
import 'package:dolphin_read/provider/theme_model.dart';
import 'package:dolphin_read/routers/application.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:bot_toast/bot_toast.dart';

import 'common/apis/apis.dart';
import 'global.dart';


void main() async {
  await Global.init();
  runApp(MyApp());
   // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserApi.getRefresh(context: context);
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;
    return  MultiProvider(
      providers: providers,
      child:Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            onGenerateRoute: Application.router.generator,
            builder: BotToastInit(),
            theme: themeModel.themeData(),
            darkTheme: themeModel.themeData(platformDarkMode: true),
            home:Global.isOfflineLogin?IndexPage():FlareSignPage(),
          );
        }
      )
    );
  }
}

