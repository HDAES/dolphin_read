/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 12:47:01
 * @LastEditTime: 2020-08-14 16:24:24
 */
import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/flip_view.dart';
import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:dolphin_read/model/index.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller = EasyRefreshController();
  ScrollController  _scrollController = ScrollController();

  int page = 1;
  List indexList = [];
  bool _enableLoad = true;
  bool toTop = false;
  var _futureBuilderFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _futureBuilderFuture= getIndex(context,false);
    _scrollController.addListener(() {
      if(_scrollController.offset>200){
        if(!toTop){
          setState(() {
            toTop = true;
          });
        }
      }else{
        if(toTop){
          setState(() {
            toTop = false;
          });
        }
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
        future: _futureBuilderFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return EasyRefresh(
              header: MaterialHeader(),
              footer: BallPulseFooter(),
              onRefresh:() async {
                setState(() {
                  page = 1;
                });
                getIndex(context,true);
              },
              onLoad:_enableLoad?() async {
                print('Load');
                setState(() {
                  page = page + 1;
                });
                getIndex(context,false);
              }:null,
              controller: _controller,
              child:StaggeredGridView.countBuilder(
                controller: _scrollController,
                crossAxisCount: 4,
                itemCount: indexList.length,
                itemBuilder: (BuildContext context, int index) => FlipViewItem(indexList[index]),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 4 : 3.5),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              )

            );
          }else{
            return SampleListItem(number: 10);
          }
        },
      ),
      floatingActionButton: toTop?FloatingActionButton(
        heroTag: 'homeEmpty',
        key: ValueKey(Icons.vertical_align_top),
        onPressed: () {
          _scrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
        },
        child: Icon(
          Icons.vertical_align_top,
        ),
      ):FloatingActionButton(
        heroTag: 'homeFab',
        key: ValueKey(Icons.search),
        onPressed: () {
          Routes.navigateTo(context, Routes.search);
        },
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }

  Future getIndex(context,refresh) async{
    IndexModel index = await  IndexApi.getIndex(context: context,params: {"page":page },refresh: refresh);
    indexList.addAll(index.data.list);
     setState(() {
      indexList = page==1?index.data.list:indexList;
      _enableLoad = index.data.hasNextPage;
    });
    return index;
  }

 
}

class FlipViewItem extends StatefulWidget {
  final IndexList item;
  FlipViewItem(this.item);
  @override
  _FlipViewItemState createState() => _FlipViewItemState();
}

class _FlipViewItemState extends State<FlipViewItem> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _curvedAnimation;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
     _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
     _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FlipView(
      animationController: _curvedAnimation,
      front: Card(
        child: InkWell(
          onTap: (){Routes.navigateTo(context, Routes.bookInfo,params:widget.item.toJson());},
          onLongPress:(){ _flip(true);},
          child: Container(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageLoadView(
                  widget.item.image,
                  height: duSetWidth(453),
                  width: duSetWidth(340),
                ),
                Text(widget.item.bookName),
                Text(widget.item.penName),
                Row(
                  children: [
                    for(int i =0;i<widget.item.cateName.length;i++)
                      Padding(
                        padding: EdgeInsets.only(right:10),
                        child: Text('${widget.item.cateName[i]}'),
                      )
                  ] 
                )
              ],
            ),
          ),
        ),
      ),
      back: InkWell(
        onDoubleTap: (){_flip(false);},
          child: Container(
            child:  ImageLoadView(
              widget.item.girlImage,
              height: duSetWidth(453),
              width: duSetWidth(340),
            ),
          ),
        ),
    );
  }

  void _flip(bool reverse) {
    if (_animationController.isAnimating) return;
    if (reverse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}