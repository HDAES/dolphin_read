/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-08-18 16:41:07
 */
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/follows.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';

class FollowBookItemWidget extends StatelessWidget {
  final FollowData item;
  FollowBookItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Routes.navigateTo(context, Routes.bookInfo,params: {"bookId":item.bookId,"type":0,"isEnd":item.isEnd});
      },
      child: Container(
        width: duSetHeight(750),
        padding: EdgeInsets.only(left:10,right:10,bottom:10),
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
                    style: TextStyle(fontSize: duSetFontSize(40)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                 
                  Text('最新章节：${item.newChapterTitle}',
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
      ),
    );
  }
}