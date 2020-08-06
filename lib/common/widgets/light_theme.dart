import 'package:flutter/material.dart';

class LightTheme extends StatelessWidget {
  final Widget child;

  LightTheme({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            accentColor: Color(0xFF33C3A5),
            primaryColor: Color(0xFF33C3A5),
            scaffoldBackgroundColor: Colors.grey[200],
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black54),
                elevation: 0.0,
                brightness: Brightness.light,
                color: Colors.white)),
        child: child);
  }
}
