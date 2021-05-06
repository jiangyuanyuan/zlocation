import 'package:cached_network_image/cached_network_image.dart';
import 'package:zlocation/common/const/cosnt.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerView extends StatelessWidget {
  final List<String> banners;

  BannerView({Key key, this.banners}) : super(key: key);

  final SwiperPlugin rect = MineRectSwiperPaginationBuilder(
    activeColor: Colors.white,
    color: Colors.white.withOpacity(0.2),
    activeSize: Size(30, 2.5),
    size: Size(15, 2.5),
    space: 5,
  );
  final dot = DotSwiperPaginationBuilder(
    activeColor: AppColor.blue,
    color: Colors.white,
    size: 7,
    activeSize: 7,
    space: 4,
  );

  // static const List<String> images = ["banner", "banner1", "banner2"];
  @override
  Widget build(BuildContext context) {
    if(banners.length == 0) return Container();
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PhysicalModel(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: banners.toString(),
              fit: BoxFit.fill,
            ),
            // child: Image.asset("assets/${images[index]}.png", fit: BoxFit.fill,),
          ),
        );
      },
      autoplay: true,
      loop: true,
      // itemCount: images.length,
      itemCount: banners.length,
      // viewportFraction: 0.8,
      // scale: 0.85,
      // pagination: SwiperPagination(builder: rect),
      pagination: SwiperPagination(),
      // control: SwiperControl(),// 左右两个箭头
    );
  }
}

class MineRectSwiperPaginationBuilder extends SwiperPlugin {
  ///color when current index,if set null , will be Theme.of(context).primaryColor
  final Color activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///Size of the rect when activate
  final Size activeSize;

  ///Size of the rect
  final Size size;

  /// Space between rects
  final double space;

  final Key key;

  const MineRectSwiperPaginationBuilder(
      {this.activeColor,
      this.color,
      this.key,
      this.size: const Size(10.0, 2.0),
      this.activeSize: const Size(10.0, 2.0),
      this.space: 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    List<Widget> list = [];

    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      Size size = active ? this.activeSize : this.size;
      list.add(Container(
      width: size.width,
      height: size.height,
      color: active ? activeColor : color,
      key: Key("pagination_$i"),
      margin: EdgeInsets.symmetric(horizontal: space),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}

