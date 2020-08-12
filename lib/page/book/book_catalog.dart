/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 14:19:46
 * @LastEditTime: 2020-08-09 16:08:55
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/book_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class BookCatalogPage extends StatefulWidget {
  final String bookId;
  final Function switchChapter;
  BookCatalogPage(this.bookId,this.switchChapter);
  @override
  _BookCatalogPageState createState() => _BookCatalogPageState();
}

class _BookCatalogPageState extends State<BookCatalogPage> {
  int page = 1;
  int size=30;
  List catalogList=[];

  @override
  void initState() {
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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('目录',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
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
                        onTap: (){
                          widget.switchChapter(snapshot.data[index]["id"]);
                          Navigator.pop(context);
                        },
                        title: Text('${snapshot.data[index]['title']}'),
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
    BookCatalogModel catalogData  = await BookApi.getBookCatalog(context: context,params: {"bookId":widget.bookId,"page":page,"size":size },isRefresh:isRefresh);
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

          