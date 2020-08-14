/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-14 09:54:03
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';

class SearchBookItemWidget extends StatelessWidget {
  final item;
  const SearchBookItemWidget(this.item);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ 
        print(item.bookId);
        Routes.navigateTo(context, Routes.bookInfo,params: item.toJson());
      },
      child: Container(
        width: duSetWidth(750),
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.only(left:10,right:10,bottom:10),
        child: Row(
          children: <Widget>[
            ImageLoadView(
              item.bookImage,
              height: duSetWidth(240),
              width: duSetWidth(180),
            ),
            Container(
              width: duSetWidth(500),
              height: duSetWidth(240),
              padding: EdgeInsets.only(left:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(item.bookName,
                    style: TextStyle(fontSize: duSetFontSize(40)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('作者：${item.panName}'),
                  Text('是否完结：${isEnd(item.isEnd)}'),
                  Text('最新章节：${item.newChapterTitle}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                  ),
                  Text('平台：${formatPlatform(item.type)}'),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}