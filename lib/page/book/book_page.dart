/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 14:19:46
 * @LastEditTime: 2020-08-09 22:01:33
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/book_catalog.dart';
import 'package:dolphin_read/model/book_content.dart';
import 'package:dolphin_read/page/book/book_catalog.dart';
import 'package:dolphin_read/page/book/book_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_html/style.dart';

class BookPage extends StatefulWidget {
  final Map params;
  BookPage(this.params);
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  bool _onTapToClose = false;

  ScrollController _scrollController=ScrollController();

  String bookId;

  dynamic nextChapterId;
  dynamic lastChapterId;
  var _futureBuilderFuture;
  double fontSzie = 18;
  bool light=true;
  List catalogList = [];
 
  @override
  void initState() {
    super.initState();
    bookId = widget.params['bookId'][0];
    _futureBuilderFuture= getBookContent(context,widget.params['chapterId'][0]);
  }

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key:_innerDrawerKey,
      onTapClose: _onTapToClose,
      swipe: true,
      leftChild:BookCatalogPage(bookId,refresh), // required if rightChild is not set
      scaffold: Scaffold(
        backgroundColor: light?ColorsUtil.hexToColor('#F5FFFA'):Colors.black,
       body:ListView(
         controller: _scrollController,
         children: <Widget>[
          FutureBuilder(
            future: _futureBuilderFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: (){openControl();},
                  child:Html(
                    data: snapshot.data.data.content,
                    style: {
                      "div":Style(
                        fontSize: FontSize(fontSzie),
                        backgroundColor: light?ColorsUtil.hexToColor('#F5FFFA'):Colors.black,
                        color: light?ColorsUtil.hexToColor('#333333'):ColorsUtil.hexToColor('#777777'),
                      ),
                    }, 
                  )
                );
              }else{
                return Center(
                  child: Text('loading'),
                );
              }
            }
          )
         ],
       )
      ) 
    );
  }

  Future getBookContent(context,chapterId) async{
    BookContentModel bookContent = await BookApi.getBookContent(context: context,params: {"chapterId":chapterId});
    nextChapterId = bookContent.data.nextId;
    lastChapterId = bookContent.data.lastId;
    _scrollController.jumpTo(0);
    return bookContent;
  }


  //切换章节
  void refresh(newChapterId){
    _futureBuilderFuture= getBookContent(context,newChapterId.toString());
  }

  //打开底部控制区
  void openControl(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
        builder: (BuildContext context) {
          return BookControlWidget(fontSzie,changeFontSize,openCatalog,changeTheme,nextChapter,lastChapter);
      }
    );
  }

  //打开目录
  void openCatalog(){
     _innerDrawerKey.currentState.toggle();
  }
  //改变模式
  void changeTheme(){
    setState(() {
      light=!light;
    });
  }
  //下一章
  void nextChapter(){
    print(nextChapterId);
    if(nextChapterId==null){
      Toast.show('暂无下一章');
    }else{
     _futureBuilderFuture= getBookContent(context,nextChapterId.toString());
    } 
  }

  //上一章
  void lastChapter(){
    if(lastChapterId==null){
      Toast.show('暂无上一章');
    }else{
     _futureBuilderFuture= getBookContent(context,lastChapterId.toString());
    } 
  }
  void changeFontSize(double size){
    setState(() {
      fontSzie=size;
    });
  }
}

