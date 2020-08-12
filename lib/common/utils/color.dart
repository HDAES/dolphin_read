/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 20:51:43
 * @LastEditTime: 2020-08-03 20:52:34
 */
import 'dart:ui' show Color;

import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/global.dart';


class ColorsUtil {
  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]

  static Color hexToColor(String s) {
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (s == null || s.length != 7 ||
        int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

  //返回字体颜色
  static Color getTextColor(){
    return Global.light?ColorsValue.textLightColor:ColorsValue.textDarkColor;
  }

  static Color getBodyColor(){
    return Global.light?ColorsValue.bodyLightColor:ColorsValue.bodyDarkColor;
  }
}