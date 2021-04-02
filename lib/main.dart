import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zlocation/page/GuidePage.dart';
import 'package:zlocation/provider/user.dart';
import 'package:zlocation/root/RootPage.dart';
import 'package:zlocation/router.dart';

import 'common/const/cosnt.dart';
import 'common/language/custom_cupertinolocal.dart';
import 'common/util/t_event_bus.dart';
import 'i18/i18n.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => UserModel(),
          child: MyApp()
      )
  );

}

GlobalKey<_FreeLocalizations> freeLocalizationStateKey1 =
new GlobalKey<_FreeLocalizations>(); //

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'location',
      theme: ThemeData(
        primaryColor: const Color(0xff5C96EA),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0, brightness: Brightness.light),
        primaryTextTheme: TextTheme(headline6: TextStyle(fontSize:17, fontFamily: "PingFang-Medium", color: AppColor.font333)),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      home: GuidePage(),
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      builder: (context, child) {
        ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
        FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
        return Material(
          type: MaterialType.transparency,
          child: FreeLocalizations(
            key: freeLocalizationStateKey1,
            child: FlutterEasyLoading(
              child: child,
            ),
          ),
        );
      },
    );
  }
}


class FreeLocalizations extends StatefulWidget {
  final Widget child;

  FreeLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<FreeLocalizations> createState() {
    return new _FreeLocalizations();
  }
}

class _FreeLocalizations extends State<FreeLocalizations> {
  Locale _locale = const Locale('zh', '');

  Future<Locale> getDeviceLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageStr = prefs.getString('languageCode');
    String country = prefs.getString('countryCode');
    if(languageStr != null) {
      return Locale(languageStr, country);
    } else {
      prefs.setString('languageCode', "zh");
      prefs.setString('countryCode', "");
      return _locale;
    }

  }

  //监听bus
  void listen(){
    teventBus.on<Locale>().listen((locale){
      changeLocale(locale);
    });
  }

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    Future<Locale> locale = getDeviceLocale();
    locale.then((locales) async {
      if(locale != null) {
        changeLocale(locales);
        // 设置语言
        I18n.locale = locales;
        teventBus.fire(locales);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    freeLocalizationStateKey1.currentState.listen();
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}