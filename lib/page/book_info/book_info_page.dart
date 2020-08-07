
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:flutter/material.dart';


class BookInfoPage extends StatefulWidget {
  final Map params;
  BookInfoPage(this.params);
  @override
  _BookInfoPageState createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.params['bookId'][0]);
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
                body: ListView(
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
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }else{
            return Text('loading');
          }
        }
      );
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