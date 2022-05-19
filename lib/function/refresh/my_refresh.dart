import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app_demo/base/view_model/my_list_view_model.dart';
import 'package:my_app_demo/function/skeleton/view_skeleton_list.dart';
import 'package:my_vm_lib/my_vm_lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_app_demo/utils/ext.dart';

typedef IndexedItemWidgetBuilder<T> = Widget Function(
    BuildContext context, T item, int index);

class MYRefresh<T> extends StatelessWidget {
  //刷新viewModel
  final MYListViewModel listViewModel;

  //数量
  final int itemCount;

  //itemBuilder 跟listview的itemBuilder一样
  final IndexedItemWidgetBuilder<T> itemBuilder;

  //listView or gridView
  final bool isListModel;

  //listview 或者 gridview的一样
  final bool shrinkWrap;

  //listview 或者 gridview的一样
  final EdgeInsetsGeometry padding;

  //gridview gridDelegate
  final SliverGridDelegate gridDelegate;
  final ScrollController scrollController;

  MYRefresh.list({
    Key key,
    @required this.listViewModel,
    @required this.itemBuilder,
    @required this.itemCount,
    this.scrollController,
    this.shrinkWrap = false,
    this.padding,
  })  : isListModel = true,
        gridDelegate = null,
        super(key: key);

  MYRefresh.grid({
    Key key,
    @required this.listViewModel,
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.gridDelegate,
    this.shrinkWrap = false,
    this.scrollController,
    this.padding,
  })  : isListModel = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      child: SmartRefresher(
        controller: listViewModel.refreshController,
        onRefresh: listViewModel.refresh,
        enablePullDown: false,
        onLoading: listViewModel.loadMoreData,
        enablePullUp: true,
        child: getChild(),
      ),
    );
  }

  Widget getChild() {
    switch (listViewModel.refreshStatus) {
      case LoadState.VIEW_SKELETON:
        return ViewSkeletonListPage();
      case LoadState.NOT_DATA:
        return getNotDataWidget();
      case LoadState.NETWORK_ERROR:
        return Container(
          child: Center(
            child: Text('网络错误'),
          ),
        );
      case LoadState.SHOW_DATA:
        return getListWidget();
    }
    //正常不会走到这里，为了取消编译警告
    return Container();
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

  Widget getListWidget() {
    if (isListModel) {
      return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return itemBuilder(context, listViewModel.list[index], index);
        },
        shrinkWrap: shrinkWrap,
        padding: padding,
      );
    } else {
      return GridView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return itemBuilder(context, listViewModel.list[index], index);
        },
        shrinkWrap: shrinkWrap,
        physics: ClampingScrollPhysics(),
        padding: padding,
        gridDelegate: gridDelegate,
      );
    }
  }
}
