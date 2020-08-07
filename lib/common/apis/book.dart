import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/model/book_info.dart';
import 'package:flutter/material.dart';

class BookApi {
  static Future<BookInfoModel> getBookInfo({@required BuildContext context,params}) async{
     var response = await HttpUtil().get(
      '/api/web/book/info',
      context: context,
      params:params
    );
  print(response);
    return BookInfoModel.fromJson(response);
  }
}