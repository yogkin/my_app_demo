import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_demo/function/refresh/my_footer.dart';
import 'package:my_app_demo/function/refresh/my_header.dart';
import 'package:my_app_demo/page/home/index.dart';
import 'package:my_app_demo/page/image_load/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'page/goods_detail/index.dart';

void main() {
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    //打印错误堆栈
    print(stackTrace);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerBuilder: () => MYRefreshFooter(),
      headerBuilder: () => MYRefreshHeader(),
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo'),
          ),
          body: Builder(
            builder: (BuildContext context) {
              ScreenUtil.init(context,
                  width: 750.0, height: 1334.0, allowFontScaling: false);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text('网络请求、MVVM'),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyTabbedPage()));
                      },
                      child: Text('下拉刷新'),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MYImagePage()));
                      },
                      child: Text('图片加载1'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
