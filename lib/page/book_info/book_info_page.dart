/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-07 23:15:34
 */

import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../common/utils/screen.dart';

class BookInfoPage extends StatefulWidget {
  final Map params;
  BookInfoPage(this.params);
  @override
  _BookInfoPageState createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.params);
    return FutureBuilder(
        future: getBookInfo(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            return LightTheme(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(snapshot.data.data.bookName),
                ),
                body: Stack(
                  children: <Widget>[
                    ListView(
                      padding: EdgeInsets.only(left:duSetWidth(20),right: duSetWidth(20)),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ImageLoadView(
                              snapshot.data.data.image,
                              height: duSetWidth(340),
                              width: duSetWidth(255),
                            ),
                            Container(
                              width: duSetWidth(420),
                              height: duSetWidth(340),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.data.bookName,
                                    style: TextStyle(fontSize: duSetFontSize(48),color: Colors.black87),
                                  ),
                                  Text(
                                    '作者：${snapshot.data.data.penName}',
                                    style: TextStyle(
                                      fontSize: duSetFontSize(36),
                                      height: 2
                                    ),
                                  ),
                                  Text('是否完结：${isEnd(widget.params['isEnd'][0])}'),
                                  Text('最新章节：${widget.params['newChapterTitle'][0]}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black54),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                          child: Text('简介：${snapshot.data.data.bookDesc}',
                            style: TextStyle(fontSize: duSetWidth(32),color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      height: duSetWidth(100),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: duSetWidth(375),
                              child: SpinKitPulse(
                                color: Colors.red,
                                size: 50.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              leftTap(context,snapshot.data.data);
                            },
                            child: Container(
                              width: duSetWidth(375),
                              height: duSetWidth(100),
                              child: Center(
                                child: snapshot.data.data.isHave?Text('阅读'):Text('暂无数据'),
                              ),
                              decoration: BoxDecoration(
                                color:  snapshot.data.data.isHave?Colors.pink:Colors.grey
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
                ,
              ),
            );
          }else{
            return Text('loading');
          }
        }
      );

    
  }

  void leftTap(context,item) async{
      if(item.isHave){
        print(12312);
      }else{
        //调取爬虫接
        SearchApi.postCrawlingNovels(context: context,params: {
          "bookId":widget.params['bookId'][0],
          "type":widget.params['type'][0],
          "isEnd":widget.params['isEnd'][0],
          "cateId":'1,2'
        });
      }
  }
  Future getBookInfo(context) async{
    return  BookApi.getBookInfo(context: null,
      params: {
        "bookId":widget.params['bookId'][0],
        "type":widget.params['type'][0]
        }
      );
  }
}