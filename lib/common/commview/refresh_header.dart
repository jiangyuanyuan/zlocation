import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

/*
  I use my plugin to implements gif effect,this plugin can help you to controll gif easily,
  see page to find about usage: (https://github.com/peng8350/flutter_gifimage)
*/
const double gifHeadFrame = 4;
const double gifFootFrame = 4;
class GifHeader1 extends RefreshIndicator {
  GifHeader1() : super(height: 80.0, refreshStyle: RefreshStyle.Follow);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GifHeader1State();
  }
}

class GifHeader1State extends RefreshIndicatorState<GifHeader1>
    with SingleTickerProviderStateMixin {
  GifController _gifController;

  @override
  void initState() {
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  void onModeChange(RefreshStatus mode) {
    if (mode == RefreshStatus.refreshing) {
      _gifController.repeat(
          min: 0, max: gifHeadFrame, period: Duration(milliseconds: 500));
    }
    super.onModeChange(mode);
  }

  @override
  Future<void> endRefresh() {
    _gifController.value = gifHeadFrame / 2;
    return _gifController.animateTo(gifHeadFrame, duration: Duration(milliseconds: 500));
  }

  @override
  void resetValue() {
    // TODO: implement resetValue
    // reset not ok , the plugin need to update lowwer
    _gifController.value = 0;
    super.resetValue();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    // TODO: implement buildContent
    // return GifImage(
    //   image: AssetImage("assets/refresh.gif"),
    //   height: 80.0,
    //   width: 537.0,
    //   controller: _gifController,
    // );
    return GifImage(
      image: AssetImage("assets/refresh.gif"),
      height: 80.0,
      width: 537.0,
      controller: _gifController,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gifController.dispose();
    super.dispose();
  }
}

class GifFooter1 extends StatefulWidget {
  final int page;
  GifFooter1(this.page) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GifFooter1State();
  }
}

class _GifFooter1State extends State<GifFooter1>
    with SingleTickerProviderStateMixin {
  GifController _gifController;

  @override
  void initState() {
    // TODO: implement initState
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomFooter(
      height: 40,
      builder: (context, mode) {
        if(widget.page < 2) return Container();
        return GifImage(
          image: AssetImage("assets/refresh.gif"),
          controller: _gifController,
        );
      },
      loadStyle: LoadStyle.ShowWhenLoading,
      onModeChange: (mode) {
        if (mode == LoadStatus.loading) {
          _gifController.repeat(
              min: 0, max: gifFootFrame, period: Duration(milliseconds: 500));
        }
      },
      endLoading: () async {
        _gifController.value = gifFootFrame / 2;
        return _gifController.animateTo(gifFootFrame,
            duration: Duration(milliseconds: 500));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gifController.dispose();
    super.dispose();
  }
}