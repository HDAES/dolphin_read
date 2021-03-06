/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-08-14 16:38:28
 */
import 'package:floating_search_bar/ui/sliver_search_bar.dart';
import 'package:flutter/material.dart';

class SearchPageWidget extends StatelessWidget {
  final Function onChanged;
  final Function iconTap;
  final Function onSubmitted;
  final TextEditingController controller;
  final FocusNode commentFocus;
  final bool searchStatus;
  final Widget body;
  final Widget floatingActionButton;
  const SearchPageWidget({Key key, this.controller,this.onChanged,this.iconTap,this.commentFocus,this.body,this.onSubmitted,this.searchStatus,this.floatingActionButton}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:floatingActionButton,
      body: NestedScrollView(
          headerSliverBuilder: (context, enabled) {
            return [
               SliverPadding(
                  padding:EdgeInsets.only(left:5,right: 5),
                  sliver: SliverFloatingBar(
                    floating:false,
                    pinned: true,
                    title:TextField(
                          focusNode: commentFocus,
                          controller: controller,
                          decoration:InputDecoration.collapsed(
                                hintText: "Search...",
                              ),
                          autofocus: false,
                          onChanged: (String text){ onChanged(text);},
                          onSubmitted: (String text){onSubmitted(text);},
                    ),
                    trailing: GestureDetector(
                      onTap: ()=>iconTap(),
                      child:searchStatus?Icon(Icons.clear):Icon(Icons.search),
                    ),
                    leading: IconButton(
                      onPressed: ()=>Navigator.pop(context),
                      icon:Icon(Icons.arrow_back),
                    ),
                  )
               )
               
            ];
          },
          body: body,
        ),
    );
  }
}