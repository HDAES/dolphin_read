import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/screen.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _commentFocus = FocusNode();
  String bookName;
  String _platform='1';
  int page =1;//页数
  bool searchStatus=false;//搜索状态
  bool isAll=false;//是否所有小说
  List platformList =[{
    "type":"0","name":'小海豚'
  },{
    "type":"1","name":'平板电子书网'
  },{
    "type":"2","name":'笔趣阁'
  }];

  List bookList=[];
  @override
  void initState() { 
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SearchPageWidget(
      onChanged: (String value){ setState(() { bookName = value;});},
      iconTap: ()=>iconTap(),
      onSubmitted:(vale){ setState(() {page=1;isAll=false;});searchBook();},
      commentFocus: _commentFocus,
      searchStatus:searchStatus,
      controller: _controller,
      body: bookList.length ==0? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(P.no_data,width: 300),
            Text('暂未搜索结果',style:TextStyle(fontSize:duSetFontSize(36))),
            GestureDetector(
              onTap: (){ _choicePlatform(context);},
              child: Text('使用云搜索',style:TextStyle(fontSize:duSetFontSize(32),color: Colors.blue)),
            )
          ],
        ),
      ): EasyRefresh(
          header: MaterialHeader(),
          footer: BallPulseFooter(),
          onLoad:() async {
            setState(() {
              page = page+1;
            });
            searchBook();
          },
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: bookList.length,
            itemBuilder: (context,item){
              return SearchBookItemWidget(bookList[item]);
            }
          )
        )
      
    );
  }

  
//搜索书籍
void  searchBook() async{
  if(!isAll){
    SearchMode respones = await  SearchApi.getSearch(context:context,params: {"bookName":bookName,"type":_platform,"page":page});
    bookList.addAll(respones.data);
    setState(() {
        bookList = page==1?respones.data:bookList;
    }); 
    if(respones.data.length>0){
      setState(() {
        searchStatus = true;
      });
    }
    if(respones.data.length==0&&page>2){
      setState(() {
        isAll=true;
      });
    }
  }
}

//右边图标点击
void iconTap() {
  _commentFocus.unfocus();
  if(searchStatus){
    _controller.clear();
    setState(() {
      searchStatus = false;
    });
  }else{
    setState(() {
      page=1;
      isAll=false;
    });
    searchBook();
  }
}
void _choicePlatform(context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ChoicePlatform(_platform,platformList,(e){
          setState(() {
            //print(e);
              _platform = e;
          });
        });
      }
  );
}
}

class ChoicePlatform extends StatefulWidget {
  final String platform;
  final List platformList;
  final Function change;
  ChoicePlatform(this.platform,this.platformList,this.change);
  @override
  _ChoicePlatformState createState() => _ChoicePlatformState();
}

class _ChoicePlatformState extends State<ChoicePlatform> {
  String platform;
  @override
  void initState() { 
     platform = widget.platform;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:10,bottom: 10),
          child:Text('平台选择',style: TextStyle(fontSize: duSetFontSize(48))),
        ),
        Expanded(
          child: ListView(
          children:widget.platformList.map((item){
            return ListTile(
              onTap: (){
                widget.change(item['type']);
                setState(() {
                  platform = item['type'];
                });
              },
              leading: Radio(
                groupValue:platform,
                activeColor: Colors.blue,
                value: "${item['type'].toString()}",
                onChanged: (String val) {
                  print(item['type']);
                    widget.change(val);
                    setState(() {
                      platform = val;
                    });
                },
              ),
              title: Text(item['name']),
            );
          }).toList()
          
        ),
        )
      ],
    );
  }
}




