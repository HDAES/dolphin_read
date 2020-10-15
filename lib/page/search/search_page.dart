import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/screen.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/global.dart';
import 'package:dolphin_read/model/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = new TextEditingController();
  bool isAll = false ; //判断是否加载完
  String _platform = '0';
  int page = 1;//页数
  bool searchStatus=false;//搜索状态
  List bookList = [];
  List<Map> searchHistory = [];
  
  @override
  void initState() {
    searchHistory = getHistoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:getStatusBarHeight()),
        child: Column(
          children: <Widget>[
            SearchInput(_controller,searchStatus,searchBook),
            !searchStatus?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HotSearch(),
                SearchHistory(searchHistory,(){removeHistory();setState(() {
                  searchHistory = [];
                }); })
              ]
            ):
            Expanded(
              child: EasyRefresh(
                header: MaterialHeader(),
                footer: BallPulseFooter(),
                onLoad:() async {
                  setState(() {
                    page = page+1;
                  });
                  searchBook(_controller.text);
                },
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: bookList.length,
                  itemBuilder: (context,item){
                    return SearchBookItemWidget(bookList[item]);
                  }
                )
              ),
            ) 
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'homeFab',
        key: ValueKey(Icons.menu),
        backgroundColor: Global.light?Theme.of(context).primaryColor:Color(0xFFF1F1F1),
        onPressed: () {
          
        },
        child: Icon(
          Icons.menu,
        ),
      ),
    );
  }



//搜索书籍
  void searchBook(bookName) async{
    if(!isAll){
      SearchMode respones = await  SearchApi.getSearch(context:context,params: {"bookName":bookName,"type":_platform,"page":page});
      setSearchHistory({"searchKey":bookName,"platform":_platform});
      if(respones.code==200){
        bookList.addAll(respones.data);
        setState(() {
          searchStatus = true;
          bookList = page==1?respones.data:bookList;
        }); 
        if(respones.data.length==0){
          Toast.show("暂未搜索到,请切换平台");
        }
        if(respones.data.length==0&&page>2){
          setState(() {
            isAll=true;
          });
        }
        //添加缓存
        
      }else{
        setState(() {
          searchStatus = false;
        });
      }
    }
  }
}



class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final bool searchStatus;
  final Function search;
  SearchInput(this.controller,this.searchStatus,this.search);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: duSetWidth(600),
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 25
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:EdgeInsets.only(bottom: 12),
                        hintText:'请输入书籍名字',
                        hintStyle: TextStyle(fontSize: duSetFontSize(30))
                      ),
                      onSubmitted:(val)=>search(val)
                    ),
                  ) 
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Global.light?Theme.of(context).primaryColor:Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Text('取消'),
          )
        ],
      ),
    );
  }
}
//热门搜索
class HotSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('热门搜索',style: TextStyle(color: Colors.black38))
        ],
      ),
    );
  }
}

//搜索历史
class SearchHistory extends StatelessWidget {
  final List<Map> searchHistory ;
  final Function clearHistory;
  SearchHistory(this.searchHistory,this.clearHistory);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('搜索历史',style: TextStyle(color: Colors.black38)),
              IconButton(
                onPressed: ()=>clearHistory(),
                icon: Icon(Icons.delete_outline,color: Colors.black38),
              )
            ],
          ),
          searchHistory!=null && searchHistory.length>0?Wrap(
            spacing: 5,
            children:searchHistory.map((item){
              return ChoiceChip(
                label:Text("${item['searchKey']}"),
                selected:false,
                backgroundColor: Global.light?Theme.of(context).primaryColor:Color(0xFFF1F1F1),
                onSelected: (bool isCheck){
                  
                }
              );
            }).toList()
          ):Padding(padding: EdgeInsets.only(top:10),child: Text('暂无历史记录')) 
        ],
      ),
    );
  }
}

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }


// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _controller = new TextEditingController();
//   FocusNode _commentFocus = FocusNode();
//   String bookName;
//   String _platform='0';
//   int page =1;//页数
//   bool searchStatus=false;//搜索状态
//   bool isAll=false;//是否所有小说
//   List platformList =[{
//     "type":"0","name":'小海豚'
//   },{
//     "type":"1","name":'平板电子书网'
//   },{
//     "type":"2","name":'笔趣阁'
//   }];
//   List bookList=[];

//   List<Map> searchHistory = [];
//   @override
//   void initState() { 
//     searchHistory = getHistoryList();
//     super.initState();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return SearchPageWidget(
//       onChanged: (String value){ setState(() { bookName = value;});},
//       iconTap: ()=>iconTap(),
//       onSubmitted:(vale){ setState(() {page=1;isAll=false;});searchBook();},
//       commentFocus: _commentFocus,
//       searchStatus:searchStatus,
//       controller: _controller,
//       body: bookList.length ==0?Column(
//         mainAxisAlignment:searchStatus?MainAxisAlignment.center:MainAxisAlignment.start,
//         children:searchStatus? <Widget>[
//           Image.asset(P.no_data,width: 300),
//           Text('暂未搜索结果',style:TextStyle(fontSize:duSetFontSize(36))),
//           GestureDetector(
//             onTap: (){ _choicePlatform(context);},
//             child: Text('使用云搜索',style:TextStyle(fontSize:duSetFontSize(32),color: Colors.blue)),
//           )
//         ]:[
//           Container(
//             padding: EdgeInsets.only(top:10),
//             width: duSetWidth(700),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('历史记录',style: TextStyle(fontSize: duSetFontSize(36))),
//                     GestureDetector(
//                       onTap: (){
//                         setState(() {
//                           searchHistory = [];
//                         });
//                         removeHistory();
//                       },
//                       child: Icon(Icons.delete_outline),
//                     )
                    
//                   ],
//                 ),
//                 searchHistory!=null && searchHistory.length>0?
//                 Wrap(
//                   spacing: 5, 
//                   children: searchHistory.map((item){
//                     return ChoiceChip(
//                       label:Text("${item['searchKey']}"),
//                       selected:false,
//                       backgroundColor: Colors.grey[400],
//                       onSelected: (bool isCheck){
//                         setState(() {
//                           bookName = item['searchKey'];
//                           _platform = item['platform'];
//                         });
//                         searchBook();
//                       }
//                     );
//                   }).toList()
//                 ):Padding(padding: EdgeInsets.only(top:10),child: Text('暂无历史记录')) 
//               ],
//             ),
//           )
//         ],
//       ): EasyRefresh(
//           header: MaterialHeader(),
//           footer: BallPulseFooter(),
//           onLoad:() async {
//             setState(() {
//               page = page+1;
//             });
//             searchBook();
//           },
//           child: ListView.builder(
//             padding: EdgeInsets.only(top: 10),
//             itemCount: bookList.length,
//             itemBuilder: (context,item){
//               return SearchBookItemWidget(bookList[item]);
//             }
//           )
//         ),
//       floatingActionButton:FloatingActionButton(
//         heroTag: 'homeFab',
//         key: ValueKey(Icons.menu),
//         onPressed: () {
//           _choicePlatform(context);
//         },
//         child: Icon(
//           Icons.menu,
//         ),
//       )
//     );
//   }

  
// //搜索书籍
// void  searchBook() async{
//   if(!isAll){
//     SearchMode respones = await  SearchApi.getSearch(context:context,params: {"bookName":bookName,"type":_platform,"page":page});
//     setSearchHistory({"searchKey":bookName,"platform":_platform});
//     if(respones.code==200){
//       bookList.addAll(respones.data);
//       setState(() {
//          searchStatus = true;
//           bookList = page==1?respones.data:bookList;
//       }); 
//       if(respones.data.length==0){
//         Toast.show("暂未搜索到,请切换平台");
//       }
//       if(respones.data.length==0&&page>2){
//         setState(() {
//           isAll=true;
//         });
//       }
//       //添加缓存
      
//     }else{
//       setState(() {
//         searchStatus = false;
//       });
//     }
//   }
// }

// //右边图标点击
// void iconTap() {
//   _commentFocus.unfocus();
//   if(searchStatus){
//     _controller.clear();

//     setState(() {
//       searchStatus = false;
//       bookList=[];
//     });
//   }else{
//     setState(() {
//       page=1;
//       isAll=false;
//     });
//     searchBook();
//   }
// }
// void _choicePlatform(context){
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return ChoicePlatform(_platform,platformList,(e){
//           setState(() {
//             //print(e);
//               _platform = e;
//           });
//         });
//       }
//   );
// }
// }

// class ChoicePlatform extends StatefulWidget {
//   final String platform;
//   final List platformList;
//   final Function change;
//   ChoicePlatform(this.platform,this.platformList,this.change);
//   @override
//   _ChoicePlatformState createState() => _ChoicePlatformState();
// }

// class _ChoicePlatformState extends State<ChoicePlatform> {
//   String platform;
//   @override
//   void initState() { 
//      platform = widget.platform;
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top:10,bottom: 10),
//           child:Text('平台选择',style: TextStyle(fontSize: duSetFontSize(48))),
//         ),
//         Expanded(
//           child: ListView(
//           children:widget.platformList.map((item){
//             return ListTile(
//               onTap: (){
//                 widget.change(item['type']);
//                 Toast.show('已选择：${item['name']}');
//                 setState(() {
//                   platform = item['type'];
//                 });
//                 Navigator.pop(context);
//               },
//               leading: Radio(
//                 groupValue:platform,
//                 activeColor: Colors.blue,
//                 value: "${item['type'].toString()}",
//                 onChanged: (String val) {
//                     widget.change(val);
//                     Toast.show('已选择：${item['name']}');
//                     setState(() {
//                       platform = val;
//                     });
//                 },
//               ),
//               title: Text(item['name']),
//             );
//           }).toList()
          
//         ),
//         )
//       ],
//     );
//   }
// }





