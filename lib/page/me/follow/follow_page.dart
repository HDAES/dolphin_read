/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 10:29:08
 * @LastEditTime: 2020-08-18 16:49:41
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/follow_book_item.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/follows.dart';
import 'package:flutter/material.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage>  with AutomaticKeepAliveClientMixin{

  dynamic _futureBuilderFuture;
  
 
  List followList = [];
 

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _futureBuilderFuture= getUserFollows(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: FutureBuilder(
        future: _futureBuilderFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              padding: EdgeInsets.only(top:getStatusBarHeight()),
              itemCount: followList.length,
              itemBuilder: (context,index){
                return FollowBookItemWidget(followList[index]);
              }
            );
          }else{
            return SampleListItem();
          }
        }
      ),
    );
  }

   Future getUserFollows(context) async{
    FollowsModel userFollow = await UserApi.getFollow(context: context);
    setState(() {
      followList = userFollow.data;
    });
    return userFollow;
  }
}