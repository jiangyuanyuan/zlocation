import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zlocation/common/const/cosnt.dart';
import 'package:zlocation/i18/i18n.dart';
import 'package:zlocation/page/friends/FriendsPage.dart';
import 'package:zlocation/page/location/page/LocationPage.dart';
import 'package:zlocation/page/my/MyPage.dart';
import 'package:zlocation/page/security/SecurityPage.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int currentIndex = 0;
  DateTime lastPopTime;

  PageController _pageController = PageController(initialPage: 0);

  List<Widget> pages = <Widget>[
    LocationPage(),
    SecurityPage(),
    FriendsPage(),
    MyPage()
  ];

  static const List<String> tabIconsName = [
    "位置_0.png",
    "好友_0.png",
    "安全_0.png",
    "我的_0.png",
  ];

  static const List<String> tabActiveIconsName = [
    "位置.png",
    "好友.png",
    "安全.png",
    "我的.png",
  ];

  @override
  void initState() {



    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<BottomNavigationBarItem> _createTabarList() {
    List<String> tabTitles = [
      I18n.of(context).location,
      I18n.of(context).friends,
      I18n.of(context).team,
      I18n.of(context).mine,
    ];
    return tabTitles.map((e) {
      final index = tabTitles.indexOf(e);
      return BottomNavigationBarItem(
          icon: Image.asset("assets/${tabIconsName[index]}",),
          activeIcon: Image.asset("assets/${tabActiveIconsName[index]}",),
          title: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(e, style: TextStyle(
                fontSize: 10,
                color: currentIndex == index ? AppColor.yellowMain : AppColor.fontgrey,
                fontWeight: FontWeight.bold
            )),
          ));
    }).toList();
  }

  void _tabIndexChanged(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
    // if(index == 0) {
    //   _requestVersion();
    //   EventBus.instance.commit(EventKeys.RereshHome, null);
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
            lastPopTime = DateTime.now();
            EasyLoading.showToast(I18n.of(context).againexit);
          }else {
            lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        },
        child: PageView(
          children: pages,
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        fixedColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        items: _createTabarList(),
        onTap: _tabIndexChanged,
      ),
    );
  }

}