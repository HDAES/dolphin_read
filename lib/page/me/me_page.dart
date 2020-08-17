/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-12 22:12:54
 * @LastEditTime: 2020-08-17 21:16:20
 */
import 'dart:math';

import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/global.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:dolphin_read/provider/theme_model.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                tooltip: "hello",
                icon: Icon(Icons.exit_to_app),
                onPressed: ()=>signOut(),
              ),
              SizedBox.shrink()
            ],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 200 + MediaQuery.of(context).padding.top,
            flexibleSpace: UserHeaderWidget(),
            pinned: false,
          ),
          UserListWidget()
        ],
      )
    );
  }
  //退出登录
  void signOut(){
    StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
    Toast.show('退出成功！');
    Routes.navigateTo(context, Routes.login);
    Global.profile=UserModel();
  }
}

class UserHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomClipper(),
      child: Container(
        color: Theme.of(context).primaryColor.withAlpha(200),
        padding: EdgeInsets.only(top: 10),
        child:  Column(
          children: <Widget>[
            Icon(Icons.expand_more),
            InkWell(
              onTap: (){ Global.profile.data?.user?.nickname?? Routes.navigateTo(context, Routes.login);},
              child: Hero(
                tag: 'loginLogo',
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/logo.jpg" ,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    color: Theme.of(context).accentColor.withAlpha(200),
                    colorBlendMode: BlendMode.colorDodge),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('${Global.profile.data?.user?.nickname??'登录'}',
              style:Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white.withAlpha(200))
            ),
          ],
        ),
      ),
    );
  }

  //头像点击
  
}

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var iconColor = Theme.of(context).accentColor;
    return ListTileTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: SliverList(
        delegate: SliverChildListDelegate([
          ListTile(
            title: Text('收藏'),
            onTap: () {
              
            },
            leading: Icon(
              Icons.favorite_border,
              color: iconColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text('黑夜模式'),
            onTap: () {
                switchDarkMode(context);
            },
            leading: Transform.rotate(
              angle: -pi,
              child: Icon(
                Theme.of(context).brightness == Brightness.light
                    ? Icons.brightness_5
                    : Icons.brightness_2,
                color: iconColor,
              ),
            ),
            trailing: CupertinoSwitch(
                activeColor: Theme.of(context).accentColor,
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  switchDarkMode(context);
                }),
          ),
          SettingThemeWidget(),
          ListTile(
            title: Text('设置'),
            onTap: () { Routes.navigateTo(context, Routes.setSystem);},
            leading: Icon(
              Icons.settings,
              color: iconColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text('检查跟新'),
            onTap: () {},
            leading: Icon(
              Icons.system_update,
              color: iconColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          SizedBox(
            height: 30,
          )
        ]),
      )
    );
  }
  void switchDarkMode(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness ==
        Brightness.dark) {
    } else {
      Provider.of<ThemeModel>(context,listen: false).switchTheme(
          userDarkMode:
              Theme.of(context).brightness == Brightness.light);
    }
  }
}

class SettingThemeWidget extends StatelessWidget {
  SettingThemeWidget();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('色彩主题'),
      leading: Icon(
        Icons.color_lens,
        color: Theme.of(context).accentColor,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: <Widget>[
              ...Colors.primaries.map((color) {
                return Material(
                  color: color,
                  child: InkWell(
                    onTap: () {
                      var model = Provider.of<ThemeModel>(context,listen: false);
                      // var brightness = Theme.of(context).brightness;
                      model.switchTheme(color: color);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                    ),
                  ),
                );
              }).toList(),
              Material(
                child: InkWell(
                  onTap: () {
                    var model = Provider.of<ThemeModel>(context,listen: false);
                    var brightness = Theme.of(context).brightness;
                    model.switchRandomTheme(brightness: brightness);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).accentColor)),
                    width: 40,
                    height: 40,
                    child: Text(
                      "?",
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}