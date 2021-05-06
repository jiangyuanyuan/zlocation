import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zlocation/common/commview/refresh_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshWidget extends StatelessWidget {

  final RefreshController controller;
  final Function onRefresh;
  final Function onLoading;
  final Widget child;
  final int minPage;

  const RefreshWidget({
    Key key, 
    this.controller, 
    this.minPage = 0,
    this.onRefresh, 
    this.onLoading, 
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: controller,
        enablePullDown: onRefresh != null,
        enablePullUp: onLoading != null,
        onRefresh: onRefresh,
        onLoading: onLoading,
        
        // header: MaterialClassicHeader(),
        header: GifHeader1(),
        footer: GifFooter1(minPage),
        // footer: CustomFooter(
        //   height: 50,
        //   builder: (BuildContext context,LoadStatus mode){
        //     Widget body ;
        //     if(mode==LoadStatus.idle){
        //       body =  Text("上拉加载更多");
        //     }
        //     else if(mode==LoadStatus.loading){
        //       body =  CupertinoActivityIndicator();
        //     }
        //     else if(mode == LoadStatus.failed){
        //       body = Text("Load Failed!Click retry!");
        //     }
        //     else if(mode == LoadStatus.canLoading){
        //       body = Text("松开加载更多");
        //     }
        //     else{
        //       body = Text(minPage < 2 ? "" : "没有更多数据了");
        //     }
        //     return Container(
        //       height: 55.0,
        //       child: Center(child:body),
        //     );
        //   },
        // ),
        child: child,
    );
  }
}