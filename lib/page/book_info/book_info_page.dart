/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-14 16:56:19
 */

import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
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

  
  bool isHave;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    print(widget.params);
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body:FutureBuilder(
          future: getBookInfo(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData) {
              isHave = snapshot.data.data.have;
              return Stack(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.bookName,
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
                                Text('最新章节：${widget.params['newChapterTitle'][0]}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10),
                        child: Text('简介：${snapshot.data.data.bookDesc}',
                          style: TextStyle(fontSize: duSetWidth(32)),
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
                          onTap: (){ rightTap(context,snapshot.data.data);},
                          child: Container(
                            width: duSetWidth(375),
                            child: Center(
                              child:snapshot.data.data.update?Text('更新章节'):Text('无法更新'),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey
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
                              child: isHave?Text('阅读'):Text('书籍入库'),
                            ),
                            decoration: BoxDecoration(
                              color:  isHave?Color(0xFF33C3A5):Colors.grey
                            ),
                          ),
                        )
                      ],
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
   
    if(item.update){
      BookApi.getUpdateBook(context: context,params: {"bookId":item.bookId});
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
                  isHave = true;
                });
              });
          }
        );
      }
  }
  //请求书籍详情
  Future getBookInfo(context) async{
    return  BookApi.getBookInfo(context: context,
      params: {
        "bookId":widget.params['bookId'][0],
        "type":widget.params['type'][0]
        }
      );
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