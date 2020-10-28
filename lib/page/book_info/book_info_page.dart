/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-10-28 11:27:12
 */

import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/global.dart';
import 'package:dolphin_read/model/book_info.dart';
import 'package:dolphin_read/model/book_tags.dart';
import 'package:dolphin_read/page/user_config/user_select_tag_page.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';
import '../../common/utils/screen.dart';

class BookInfoPage extends StatefulWidget {
  final Map params;
  BookInfoPage(this.params);
  @override
  _BookInfoPageState createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {

  var  _futureBuilderFuture;
  bool updateStatus = true;
  BookInfoModel bookInfo;
   @override
  void initState() {
    
     _futureBuilderFuture= getBookInfo(context);
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('详情'),
        ),
        body:FutureBuilder(
          future: _futureBuilderFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(left:duSetWidth(20),right: duSetWidth(20),top:10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.bookName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: duSetFontSize(48)),
                                ),
                                Text(
                                  '作者：${snapshot.data.data.penName}',
                                  style: TextStyle(
                                    fontSize: duSetFontSize(36),
                                    height: 2
                                  ),
                                ),
                                Text('是否完结：${isEnd(widget.params['isEnd'][0])}'),
                                Text('最新章节：${snapshot.data.data.newChapterTitle??'未知'}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10),
                        child: Text('简介：${snapshot.data.data.bookDesc}',
                          style: TextStyle(fontSize: duSetFontSize(36),color: Color(0xFF666666)),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    width: duSetWidth(750),
                    child: Container(
                      color: Global.light?Theme.of(context).primaryColor:Colors.white,
                      padding: EdgeInsets.only(bottom:10,top:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: duSetWidth(375),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){ lickOnTap();},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(bookInfo.data.follow?Icons.favorite:Icons.favorite_border,
                                        color: bookInfo.data.follow?Colors.red:Theme.of(context).textTheme.bodyText1.color),
                                      Text(bookInfo.data.follow?'已收藏':'收藏')
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){ rightTap(context,snapshot.data.data);},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(bookInfo.data.update?Icons.refresh:Icons.report_off),
                                      Text(bookInfo.data.update?'更新章节':'最新章节')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          GestureDetector(
                            onTap: (){
                              leftTap(context,snapshot.data.data);
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Center(
                                child:Row(
                                  children: [
                                    Icon(bookInfo.data.have?Icons.book:Icons.arrow_downward,color: Colors.white,),
                                    Text(bookInfo.data.have?'立即阅读':'书籍入库',style: TextStyle(color: Colors.white))
                                  ],
                                )
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFD24444),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.0,16.0),
                                    color: Color(0xFFD24444),
                                    blurRadius: 25.0,
                                    spreadRadius: -15.0
                                  )
                                ]
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }else{
              return LoadingWidget();
            }
          }
        )
      );
  }
  
  void rightTap(context,item) async{
    if(item.update && updateStatus){
      setState(() {
        updateStatus = false;
        bookInfo.data.update = false;
      });
     var response = await  BookApi.getUpdateBook(context: context,params: {"bookId":item.bookId});
     if(response['code'] == 200){
        Toast.show(response['message']);
     }
    }else{
      Toast.show('暂不能更新');
    }
  }

  void leftTap(context,item) async{
      if(item.have){
        Routes.navigateTo(context, Routes.book,params: {"bookId":item.bookId,"chapterId":item.chapterId});
      }else{
        BookTagsModel bookTags = await BookApi.getBookTags(context: context);
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
            builder: (BuildContext context) {
              return ChoiceTags(bookTags,widget.params,(){
                setState(() {
                  bookInfo.data.have = true;
                });
              });
          }
        );
      }
  }

  //收藏按钮
  lickOnTap() async{
    var response = await UserApi.postFollow(context:context,params: {
      "bookId":widget.params['bookId'][0],
    });
    if(response['code']==200){
      Toast.show(bookInfo.data.follow?'取消收藏':'已收藏');
      setState(() {
        bookInfo.data.follow = !bookInfo.data.follow;
      });
    }
  }

 
//请求书籍详情
Future getBookInfo(context) async{
    BookInfoModel info = await  BookApi.getBookInfo(context: context,
      params: {
        "bookId":widget.params['bookId'][0],
        "type":widget.params['type'][0]
        }
      );
      
      setState(() {
        bookInfo = info;
      });
      return info;
  }
}




class ChoiceTags extends StatefulWidget {
  final BookTagsModel bookTags;
  final Map params;
  final Function aa;
  ChoiceTags(this.bookTags,this.params,this.aa);
  @override
  _ChoiceTagsState createState() => _ChoiceTagsState();
}

class _ChoiceTagsState extends State<ChoiceTags> {
  List<int> _selectTags = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:10,bottom: 10),
              child:Text('标签选择',style: TextStyle(fontSize: duSetFontSize(48))),
            ),
            Wrap(
              spacing: 5, 
              children:widget.bookTags.data.map((item){
                return ChoiceChip(
                  label: Text(item.name,style: TextStyle(color: Colors.white)), 
                  selected: _selectTags.contains(item.id),
                  backgroundColor: Colors.grey[400],
                  selectedColor:  strToColor(item.name),
                  onSelected: (bool isCheck){ setState(() {
                    if(_selectTags.length<3){
                      isCheck?_selectTags.add(item.id):_selectTags.remove(item.id);
                      isCheck?Toast.show("已选择:${item.name}"):Toast.show("已取消:${item.name}");
                    }else{
                      Toast.show("最多选择3个标签");
                    }
                    if(!isCheck){
                      _selectTags.remove(item.id);
                      Toast.show("已取消:${item.name}");
                    }
                  });},
                );
              }).toList()
              )
          ],
        ),
        InkWell(
          onTap: (){
            //调取爬虫接
            SearchApi.postCrawlingNovels(context: context,params: {
              "bookId":widget.params['bookId'][0],
              "type":widget.params['type'][0],
              "isEnd":widget.params['isEnd'][0],
              "cateId":_selectTags.toString().replaceAll("[","").replaceAll("]", "")
            });
            widget.aa();
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom:10),
            alignment: Alignment.center,
            width: duSetWidth(600),
            height: duSetWidth(100),
            child: Text('开始爬取',style: TextStyle(fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(duSetWidth(100)),
              gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(255, 193, 7, .6),
                Color.fromRGBO(255, 235, 59, .6),
              ],
          )
            ),
          ),
        )
      ],
    );
  }

}