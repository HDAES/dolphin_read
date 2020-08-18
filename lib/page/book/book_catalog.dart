/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 14:19:46
 * @LastEditTime: 2020-08-18 16:05:53
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/book_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class BookCatalogPage extends StatefulWidget {
  final String bookId;
  final Function switchChapter;
  final String chapterId;
  final int idx;
  BookCatalogPage(this.bookId,this.switchChapter,this.chapterId,this.idx);
  @override
  _BookCatalogPageState createState() => _BookCatalogPageState();
}

class _BookCatalogPageState extends State<BookCatalogPage> {
  int page = 1;
  int size=30;
  int type = 1;
  List catalogList=[];

  @override
  void initState() {
    page = (widget.idx~/size)+1;
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目录'),
        actions:[
          IconButton(
            onPressed: (){
              setState(() {
                type == 2?type=1:type = 2;
                page = 1;
              });
            },
            icon: Icon(Icons.swap_vert),
          )
        ]
      ),
      body:FutureBuilder(
            future: getBookCatalog(context,false),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return EasyRefresh(
                  header: MaterialHeader(),
                  footer: BallPulseFooter(),
                  onRefresh: () async {
                    if (mounted) {
                      setState(() {
                        page=1;
                      });
                    }
                  },
                  onLoad: () async {
                    setState(() {
                      page=page+1;
                    });
                  },
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        selected: snapshot.data[index]["id"] == int.parse(widget.chapterId),   
                        focusColor: Theme.of(context).primaryColor,
                        onTap: (){
                          widget.switchChapter(snapshot.data[index]["id"]);
                          Navigator.pop(context);
                        },
                        title: Text(
                          '${snapshot.data[index]['title']}'
                        ),
                      );
                    }
                  )
                );
              }else{
                return LoadingWidget();
              }
            },
          ),
    );
  }

  Future getBookCatalog(context,bool isRefresh) async{
    BookCatalogModel catalogData  = await BookApi.getBookCatalog(context: context,params:
     {"bookId":widget.bookId,"page":page,"size":size,"type":type },
     isRefresh:isRefresh);
    List bookCatalogList = catalogData.toJson()['data']['list'];
    
    if(page==1){
      catalogList=bookCatalogList;
      return catalogList;
    }else{
      catalogList.addAll(bookCatalogList);
      return catalogList;
    }  
  }
}

          