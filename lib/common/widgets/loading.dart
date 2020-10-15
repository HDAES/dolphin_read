/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-10-15 13:53:20
 */


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 40,
          height: 40,
          child: SpinKitWave(color: Theme.of(context).primaryColor,size: 30),
        ),
      )
    );
  }
}

