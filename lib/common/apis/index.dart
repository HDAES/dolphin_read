import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/model/index_banner.dart';
import 'package:flutter/material.dart';

class  IndexApi {
  static Future<IndexBanner> getIndexBanner({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/api/novel/index/rotation',
      context: context
    );
    return IndexBanner.fromJson(response);
  }
}