import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/toast.dart';
import 'package:dolphin_read/model/search.dart';
import 'package:flutter/material.dart';

class SearchApi{
  static Future<SearchMode> getSearch({@required BuildContext context,params}) async{
    Toast.showLoading();
    print(params);
     var response = await HttpUtil().get(
      '/api/search/book/name',
      context: context,
      params: params
    );
    Toast.close();
    return SearchMode.fromJson(response);
  }
}