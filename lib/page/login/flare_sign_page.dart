/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-02 22:35:57
 * @LastEditTime: 2020-08-18 10:27:44
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dolphin_read/page/login/flare_sign_in_controller.dart';
import 'package:dolphin_read/page/login/signin_button.dart';
import 'package:dolphin_read/page/login/tracking_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FlareSignPage extends StatefulWidget {
  @override
  _FlareSignPageState createState() => _FlareSignPageState();
}

class _FlareSignPageState extends State<FlareSignPage> {
  FlareSignInController _signInController;

  @override
  void initState() {
    _signInController = FlareSignInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750, height: 1334);
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black54,
        ),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                        0.0,
                        1.0
                      ],
                          colors: [
                        Color.fromRGBO(63, 64, 121, 1),
                        Color.fromRGBO(63, 64, 121, 1),
                      ])),
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 160,
                      alignment: Alignment.bottomCenter,
                      child: FlareActor(
                        'assets/Teddy.flr',
                        shouldClip: false,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        controller: _signInController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TrackingTextInput(
                                  label: 'Accout',
                                  hint: '账号',
                                  onCaretMoved: (Offset caret) {
                                    _signInController.lookAt(caret);
                                  },
                                  onTextChanged: (String value){
                                    _signInController.setAccout(value);
                                  },
                                ),
                                TrackingTextInput(
                                  label: 'Password',
                                  hint: '密码',
                                  isObscured: true,
                                  onCaretMoved: (Offset caret) {
                                    _signInController.coverEyes(caret != null);
                                    _signInController.lookAt(null);
                                  },
                                  onTextChanged: (String value) {
                                    _signInController.setPassword(value);
                                  },
                                ),
                                SigninButton(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () =>{
                                    _signInController.submitPassword(context),
                                  }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top:getStatusBarHeight()+10,
                right: 10,
                child: GestureDetector(
                  onTap: ()=>{Routes.navigateTo(context, Routes.index,clear: true)},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('跳过',style: TextStyle(fontSize: duSetFontSize(36),color: Colors.white)),
                      Icon(Icons.arrow_forward,color: Colors.white)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}