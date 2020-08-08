import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/model/book_catalog.dart';
import 'package:dolphin_read/model/book_content.dart';
import 'package:dolphin_read/model/book_info.dart';
import 'package:dolphin_read/model/book_tags.dart';
import 'package:flutter/material.dart';

class BookApi {
  static Future<BookInfoModel> getBookInfo({@required BuildContext context,params}) async{
    var response = await HttpUtil().get(
      '/api/web/book/info',
      context: context,
      params:params,
      refresh:true
    );
    return BookInfoModel.fromJson(response);
  }

  //获取分类
  static Future<BookTagsModel> getBookTags({@required BuildContext context}) async {
    var response = await HttpUtil().get(
      '/api/obtain/son/cate',
      context: context
    );
    return BookTagsModel.fromJson(response);
  }

  //更新本地书籍
  static Future getUpdateBook({@required BuildContext context,params}) async {
    var response = await HttpUtil().get(
      '/api/update/book',
      context: context,
      params:params,
    );
    return response;
  }

  //获取书籍目录
  static Future<BookCatalogModel> getBookCatalog({@required BuildContext context,params,isRefresh}) async {
    var response = await HttpUtil().get(
      '/api/book/chapter/list',
      context: context,
      params:params,
      refresh: isRefresh
    );
    return BookCatalogModel.fromJson(response);
  }

  //获取书籍内容
  static Future<BookContentModel> getBookContent({@required BuildContext context,params}) async {
    print(params);
    var response = await HttpUtil().get(
      '/api/book/chapter/content',
      context: context,
      params:params,
      refresh: true
    );
    return BookContentModel.fromJson(response);
  }
}