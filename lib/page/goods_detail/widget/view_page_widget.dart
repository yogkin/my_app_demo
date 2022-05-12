
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as ref;

class ViewPageWidget extends StatefulWidget {
  final bool needLoadMore;
  final ScrollController scrollviewController;

  ViewPageWidget(
      {Key key, this.needLoadMore = false, this.scrollviewController})
      : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget>
    with AutomaticKeepAliveClientMixin {
  List list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
  }

  ref.RefreshController _refreshController =
      ref.RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ref.SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: widget.needLoadMore ? _onLoading : null,
      enablePullDown: false,
      enablePullUp: true,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: ListTile(
              title: Text("$index"),
            ),
          );
        },
        itemCount: list1.length,
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
    setState(() {
      print("我是调用的内部刷新1");
    });
  }

  void _onLoading() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List list2 = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
      list1.addAll(list2);
      print("我是调用的内部加载1");
    });
    _refreshController.loadComplete();
  }

  @override
  bool get wantKeepAlive => true;
}
