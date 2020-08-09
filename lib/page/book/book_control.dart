/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 16:29:44
 * @LastEditTime: 2020-08-09 22:01:56
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dolphin_read/common/utils/utils.dart';
class BookControlWidget extends StatefulWidget {
  final double fontSzie;
  final Function changeFontSize;
  final Function openCatalog;
  final Function changeTheme;
  final Function nextChapter;
  final Function lastChapter;
  BookControlWidget(this.fontSzie,this.changeFontSize,this.openCatalog,this.changeTheme,this.nextChapter,this.lastChapter);
  @override
  _BookControlWidgetState createState() => _BookControlWidgetState();
}

class _BookControlWidgetState extends State<BookControlWidget> {
  
  double _fontSize;
  @override
  void initState() {
    _fontSize = widget.fontSzie;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:duSetWidth(50),left: duSetWidth(40),right: duSetWidth(40)),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){widget.lastChapter();},
                child: Padding(
                  padding: EdgeInsets.only(left:40,right:40),
                  child: Text('上一章',style: TextStyle(color: Colors.white70,fontSize: duSetFontSize(36))),
                ),
              ),
               GestureDetector(
                 onTap:(){ widget.nextChapter();},
                child: Padding(
                  padding: EdgeInsets.only(left:40,right:40),
                  child: Text('下一章',style: TextStyle(color: Colors.white70,fontSize: duSetFontSize(36))),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60,
                child: Text('字    号',style: TextStyle(color: Colors.white70,fontSize: duSetFontSize(36))),
              ),
              Slider(
                onChanged: (e){
                  setState(() {
                    _fontSize= e;
                  });
                },
                onChangeEnd: (value){
                  widget.changeFontSize(value);
                },
                activeColor:ColorsUtil.hexToColor('#33C3A5'),
                inactiveColor: ColorsUtil.hexToColor('#2F4B61'),
                value: _fontSize,
                max: 40,
                min: 12,
              ),
              Icon(Icons.format_size,color: Colors.white,size: duSetFontSize(68)),
              
            ],
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     SizedBox(
          //       width: 60,
          //       child: Text('行间距',style: TextStyle(color: Colors.white70,fontSize: duSetFontSize(36))),
          //     ),
          //     Slider(
          //       onChanged: (e){
          //         setState(() {
          //           _fontSize= e;
          //         });
          //       },
          //       onChangeEnd: (value){
          //         widget.changeFontSize(value);
          //       },
          //       activeColor:ColorsUtil.hexToColor('#33C3A5'),
          //       inactiveColor: ColorsUtil.hexToColor('#2F4B61'),
          //       value: _fontSize,
          //       max: 40,
          //       min: 12,
          //     ),
          //     Icon(Icons.format_line_spacing,color: Colors.white,size: duSetFontSize(68)),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  widget.openCatalog();
                },
                icon: Icon(Icons.menu),
                color: Colors.white70,
                iconSize: duSetFontSize(68)
              ),
              IconButton(
                onPressed: (){ widget.changeTheme();},
                icon: Icon(Icons.brightness_2),
                color: Colors.white70,
                iconSize: duSetFontSize(68)
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.bookmark_border),
                color: Colors.white70,
                iconSize: duSetFontSize(68)
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.settings),
                color: Colors.white70,
                iconSize: duSetFontSize(68)
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.cloud_download),
                color: Colors.white70,
                iconSize: duSetFontSize(68)
              ),
            ],
          )
        ],
      ),
    );
  }
}