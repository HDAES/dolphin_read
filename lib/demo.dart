
import 'package:mobsms/mobsms.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Smssdk.getTextCode("19942326969","86","16495772", (dynamic ret, Map err){
              print(ret);
              print(err);
            });
          },
          child: Text('click'),
        ),
      ),
    );
  }
}