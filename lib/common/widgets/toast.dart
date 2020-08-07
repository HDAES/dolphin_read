/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-07 22:19:45
 */
import 'dart:core';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animations/loading_animations.dart';

class Toast{
  static show(String msg){
    BotToast.showText(text: msg);
  }

  static showLoading({
    WrapAnimation wrapAnimation ,
    WrapAnimation wrapToastAnimation,
    Alignment align = Alignment.center,
    BackButtonBehavior backButtonBehavior,
    bool crossPage = true,
    bool clickClose = true,
    bool allowClick = false,
    VoidCallback onClose,
    Duration duration,
    Duration animationDuration,
    Duration animationReverseDuration,
    Color backgroundColor = Colors.black26,
  }){
    
    Color color = slRandomColor();
    
    List<Widget> list =[
      SpinKitPumpingHeart(color:color),
      SpinKitPulse(color:color),
      SpinKitDoubleBounce(color:color),
      SpinKitWave(color:color),
      SpinKitThreeBounce(color:color),
      SpinKitWanderingCubes(color:color),
      SpinKitWanderingCubes(color:color),
      SpinKitCircle(color:color),
      SpinKitFadingFour(color:color),
      SpinKitFadingCube(color:color),
      SpinKitCubeGrid(color:color),
      SpinKitFoldingCube(color:color),
      SpinKitRing(color:color),
      SpinKitDualRing(color:color),
      SpinKitRipple(color:color),
      SpinKitFadingGrid(color:color),
      SpinKitSquareCircle(color:color),
      SpinKitSpinningCircle(color:color),
      SpinKitFadingCircle(color:color),
      SpinKitHourGlass(color:color),
      SpinKitPouringHourglass(color:color),
    ];
    BotToast.showCustomLoading(
        wrapAnimation: wrapAnimation,
        wrapToastAnimation: wrapToastAnimation,
        align: align,
        backButtonBehavior: backButtonBehavior,
        toastBuilder: (_) =>    getRandom(list),
        clickClose: clickClose,
        allowClick: allowClick,
        crossPage: crossPage,
        ignoreContentClick: true,
        onClose: onClose,
        duration: duration,
        animationDuration: animationDuration,
        animationReverseDuration: animationReverseDuration,
        backgroundColor: backgroundColor);
  }

  static close(){
    BotToast.closeAllLoading();
  }

  static Widget getRandom(List array) {
    int rnd = new Random().nextInt(array.length);
    return array[rnd];
  }

  static Color slRandomColor({int r = 255, int g = 255, int b = 255, a = 255}) {
  if (r == 0 || g == 0 || b == 0) return Colors.black;
  if (a == 0) return Colors.white;
  return Color.fromARGB(
    a,
    r != 255 ? r : Random.secure().nextInt(r),
    g != 255 ? g : Random.secure().nextInt(g),
    b != 255 ? b : Random.secure().nextInt(b),
  );
}
}

