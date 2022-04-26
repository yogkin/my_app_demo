import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_demo/function/refresh/my_footer.dart';
import 'package:my_app_demo/function/refresh/my_header.dart';
import 'package:my_app_demo/page/home/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'utils/loading_utils.dart';

void main() {
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
        builder: (context, child) {
          LoadingUtils.init();
          ScreenUtil.init(context,
              width: 750.0, height: 1334.0, allowFontScaling: false);
          return child;
        },
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
              return Center(
                child: OutlineButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('点击跳转'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
