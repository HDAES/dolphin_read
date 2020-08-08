import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/model/book_catalog.dart';
import 'package:dolphin_read/model/book_content.dart';
import 'package:dolphin_read/page/book/book_catalog.dart';
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
  final String bookId = "1291915132661796864";
  List catalogList = [];
  String chapterId;
  String content='';
  @override
  void initState() {
    chapterId = widget.params['chapterId'][0];
    super.initState();
  }

  @override
  void dispose() { 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print( widget.params);
    return InnerDrawer(
      key:_innerDrawerKey,
      onTapClose: _onTapToClose,
      swipe: true,
      leftChild:BookCatalogPage(bookId,refresh), // required if rightChild is not set
      scaffold: Scaffold(
       body:ListView(
         children: <Widget>[
          FutureBuilder(
            future: getBookContent(context),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return Html(
                  data: snapshot.data.data.content,
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

  Future getBookContent(context) async{
    
    BookContentModel bookContent = await BookApi.getBookContent(context: context,params: {"chapterId":chapterId});
    
   
    return bookContent;
  }


  void refresh(newChapterId){
    print(newChapterId);
    setState(() {
      chapterId = newChapterId.toString();
    });
  }
}