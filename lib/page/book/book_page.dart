/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 14:19:46
 * @LastEditTime: 2020-08-18 18:38:55
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/book_content.dart';
import 'package:dolphin_read/page/book/book_catalog.dart';
import 'package:dolphin_read/page/book/book_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_html/style.dart';

import '../../global.dart';

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

  ScrollController _scrollController;

  String bookId;
  String chapterId;
  String title;
  dynamic nextChapterId;
  dynamic lastChapterId;
  dynamic _futureBuilderFuture;
  double fontSzie;
  bool light;
  Data bookData;
  List catalogList = [];

  @override
  void initState() {
    super.initState();
    chapterId = widget.params['chapterId'][0];
    bookId = widget.params['bookId'][0];
    light = Global.light;
    fontSzie = Global.fontSzie;
    _futureBuilderFuture = getBookContent(context);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureBuilderFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return InnerDrawer(
                key: _innerDrawerKey,
                onTapClose: _onTapToClose,
                swipe: true,
                leftChild: BookCatalogPage(bookId,switchChapter,chapterId,bookData.idx), // required if rightChild is not set
                scaffold: Scaffold(
                    backgroundColor: ColorsUtil.getBodyColor(),
                    body: Stack(
                      children: [
                        Positioned(
                          top:getStatusBarHeight(),
                          child: Text(title,style: TextStyle( color: ColorsUtil.getTextColor())),
                        ),
                        ListView(
                          padding: EdgeInsets.only(top:50),
                          controller: _scrollController,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  openControl();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom:80),
                                  child: Html(
                                  data: bookData.content,
                                  style: {
                                    "div": Style(
                                      fontSize: FontSize(fontSzie),
                                      color: ColorsUtil.getTextColor(),
                                    ),
                                  },
                                
                                ))),
                            Padding(
                              
                              padding: EdgeInsets.only(bottom: duSetWidth(80)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => lastChapter(),
                                    child: Container(
                                      width: duSetWidth(200),
                                      height: duSetHeight(60),
                                      alignment: Alignment.center,
                                      child: Text('上一章',
                                          style: TextStyle(
                                              color: ColorsUtil.getTextColor())),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                              color: ColorsUtil.getTextColor())),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () => openCatalog(),
                                      icon: Icon(Icons.menu),
                                      color: ColorsUtil.getTextColor(),
                                      iconSize: duSetFontSize(68)),
                                  GestureDetector(
                                      onTap: () => nextChapter(),
                                      child: Container(
                                        width: duSetWidth(200),
                                        height: duSetHeight(60),
                                        alignment: Alignment.center,
                                        child: Text('下一章',
                                            style: TextStyle(
                                                color: ColorsUtil.getTextColor())),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ColorsUtil.getTextColor())),
                                      ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                    
                  ));
          } else {
            return Center(
              child: LoadingWidget(),
            );
          }
        });
  }

  Future getBookContent(context) async {
    BookContentModel bookContent = await BookApi.getBookContent(
        context: context, params: {"chapterId": chapterId});
    nextChapterId = bookContent.data.nextId;
    lastChapterId = bookContent.data.lastId;
    setState(() {
      bookData = bookContent.data;
      title = bookContent.data.title;
    });
    return bookContent;
  }

  //切换章节
  void switchChapter(newChapterId) {
    setState(() {
      chapterId = newChapterId.toString();
    });
    _scrollController.jumpTo(0);
    _futureBuilderFuture = getBookContent(context);
  }

  //打开底部控制区
  void openControl() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (BuildContext context) {
          return BookControlWidget(fontSzie, light, changeFontSize, openCatalog,
              changeTheme, nextChapter, lastChapter);
        });
  }

  //打开目录
  void openCatalog() {
    _innerDrawerKey.currentState.toggle();
  }

  //下一章
  void nextChapter() {
    if (nextChapterId == null) {
      Toast.show('暂无下一章');
    } else {
      _scrollController.jumpTo(0);
      setState(() {
        chapterId = nextChapterId.toString();
      });
      _futureBuilderFuture = getBookContent(context);
    }
  }

  //上一章
  void lastChapter() {
    if (lastChapterId == null) {
      Toast.show('暂无上一章');
    } else {
      _scrollController.jumpTo(0);
      setState(() {
        chapterId = lastChapterId.toString();
      });
      _futureBuilderFuture = getBookContent(context);
    }
  }

  void changeFontSize(double size) {
    setState(() {
      fontSzie = size;
    });
    StorageUtil().setJSON('fontSize', size);
    Global.fontSzie = size;
  }

  //改变主题
  //改变模式
  void changeTheme() {
    StorageUtil().setBool('theme', !light);
    Global.light = !light;
    setState(() {
      light = !light;
    });
  }
}
