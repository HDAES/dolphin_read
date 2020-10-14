/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-10-14 14:55:37
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/user_history.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';

class HistoryBookItemWidget extends StatelessWidget {
  final HistoryData item;
  HistoryBookItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Routes.navigateTo(context, Routes.book,params: {"bookId":item.bookId,"chapterId":item.chapterId});
      },
      child: Container(
        width: duSetHeight(750),
        padding: EdgeInsets.all(10),
        child:Row(
          children: [
            ImageLoadView(
              item.image,
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
                    style: TextStyle(fontSize: duSetFontSize(36)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("阅读至：${item.title}"),
                  Text('最新章节：${item.updateTitle}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text('分类：'),
                      Row(
                        children: item.cateName.map((cate){
                          return Padding(
                            padding: EdgeInsets.only(right:10),
                            child: Text('$cate'),
                          );
                        }).toList(),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width:1,color: ColorsValue.spacerColor))
        ),
      ),
    );
  }
}