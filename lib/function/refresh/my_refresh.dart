import 'package:flutter/material.dart';
import 'package:my_app_demo/base/view_model/my_list_view_model.dart';
import 'package:my_base/my_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_app_demo/utils/ext.dart';

class MYRefresh extends StatelessWidget {
  final MYListViewModel listViewModel;
  final Widget child;

  MYRefresh({Key key, @required this.listViewModel, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: listViewModel.refreshController,
      onRefresh: listViewModel.refresh,
      onLoading: listViewModel.loadMoreData,
      enablePullUp: true,
      child: getChild(),
    );
  }

  Widget getChild() {
    switch (listViewModel.refreshStatus) {
      case LoadState.VIEW_SKELETON:
        return Container(
          child: Center(
            child: Text('鱼骨图'),
          ),
        );
      case LoadState.NOT_DATA:
        return getNotDataWidget();
      case LoadState.NETWORK_ERROR:
        return Container(
          child: Center(
            child: Text('网络错误'),
          ),
        );
      case LoadState.SHOW_DATA:
        return child;
    }
  }

  ///获取列表默认无数据的widget
  Widget getNotDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(
          flex: 162,
        ),
        Image.asset(
          "assets/img/icon_not_data.png",
          fit: BoxFit.fill,
          height: 324.w,
          width: 324.w,
        ),
        Text(
          "暂无数据～",
          style: TextStyle(color: Color(0xFFA9ADB6), fontSize: 26.sp),
        ),
        Spacer(
          flex: 260,
        ),
      ],
    );
  }
}
