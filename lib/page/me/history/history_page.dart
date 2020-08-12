import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/user_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  EasyRefreshController _controller = EasyRefreshController();
  dynamic _futureBuilderFuture;
  
  int page = 1;
  int size = 10;
  List historyList = [];
  bool _enableLoad = true;
  @override
  void initState() {
     _futureBuilderFuture= getUserHistory(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历史记录'),
      ),
      body: FutureBuilder(
        future: _futureBuilderFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return EasyRefresh(
              header: MaterialHeader(),
              footer: BallPulseFooter(),
              controller: _controller,
              onRefresh:() async {
                setState(() {
                  page = 1;
                });
                getUserHistory(context);
              },
              onLoad:_enableLoad?() async {
                print('Load');
                setState(() {
                  page = page + 1;
                });
                getUserHistory(context);
              }:null,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: historyList.length,
                itemBuilder: (context,index){
                  return HistoryBookItemWidget(historyList[index]);
                }
              )
            );
          }else{
            return SampleListItem();
          }
        }
      ),
    );
  }

   Future getUserHistory(context) async{
    UserHistoryModel  userHistory = await UserApi.getHistory(context: context,params: {"page":page,"size":size});
    
    historyList.addAll(userHistory.data.list);
    setState(() {
      historyList = page==1?userHistory.data.list:historyList;
      _enableLoad = userHistory.data.hasNextPage;
    });
    
    return userHistory;
  }
}