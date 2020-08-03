/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-03 22:24:01
 * @LastEditTime: 2020-08-03 22:24:40
 */
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          color: Colors.yellow,
        ),
        Expanded(
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: <Widget>[
                Text('13'),
                Text('13'),
                Text('13')
              ],
            ),
          ) ,
        )
      ],
    );
  }
}