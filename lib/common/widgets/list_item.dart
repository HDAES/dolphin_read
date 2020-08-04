import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// 简单列表项
class SampleListItem extends StatelessWidget {
  

  final int number;

  const SampleListItem({
    Key key,
    this.number=4
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child:MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
          itemCount:number,
          itemBuilder: (_, __) => Padding(
            padding:EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 80.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                height: 15.0,
                                color: Colors.grey[200],
                              ),
                              Container(
                                width: 60.0,
                                height: 10.0,
                                margin: EdgeInsets.only(top: 8.0),
                                color: Colors.grey[200],
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 10.0,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            height: 10.0,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            height: 10.0,
                            width: 150.0,
                            color: Colors.grey[200],
                          ),
                        ],
                      )
                    ],
                  )
                )
              ]
            )
          )
        ))
        
    );
    
  }
}
