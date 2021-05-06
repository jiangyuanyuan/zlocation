
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zlocation/common/commview/commback_view.dart';
import 'package:zlocation/common/commview/refresh.dart';
import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/common/textstyle/textstyle.dart';

import 'cell/FriendsCell.dart';

class FriendsPage extends StatefulWidget{
  @override
  _FriendsPageState createState() {
    return _FriendsPageState();
  }
}

class _FriendsPageState extends State<FriendsPage> {
  int page = 0;
  RefreshController _refreshController = RefreshController(initialRefresh: true);
  String min = "1";
  String max = "20";
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list.add("1");
    list.add("1");
    list.add("1");
    list.add("1");
    list.add("1");
    list.add("1");
    list.add("1");
  }
  @override
  void dispose() {

    super.dispose();
  }

  void _refresh() {
    page = 1;
    _request(true);
  }

  void _loading() {
    page += 1;
    _request();
  }

  void _endRefresh() {
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  void _request([bool refresh = false]) {
    // Networktool.request(API.adList+"/$min/$max/$page/10", method: HTTPMETHOD.GET, success: (data) {
    //   final temp = ExchangeResponse.fromJson(data);
    //   if(refresh) list.clear();
    //   if(temp.data.length < 10) _refreshController.loadNoData();
    //   list.addAll(temp.data);
    //   if(mounted) setState(() {
    //
    //   });
    // }, fail: (msg) => EasyLoading.showToast(msg)
    //     ,finaly: _endRefresh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommbackView(
        titles: "我的好友",
        leading: SizedBox(),
        actions: [
          InkWell(
            child: Container(
                padding:
                EdgeInsets.only(left: 10, right: 15, bottom: 10, top: 15),
                child: Text("添加",style: AppFont.textStyle(16, color: AppColor.fontred),),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/exchangerecord");
            },
          )
        ],
        child: RefreshWidget(
          onRefresh: _refresh,
          onLoading: _loading,
          controller: _refreshController,
          minPage: page,
          child: ListView.builder(
              itemCount: list.length + 1,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return FriendCell();
              }
          ),
        ),
      ),
    );

  }
}