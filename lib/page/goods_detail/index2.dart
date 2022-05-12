import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as refresh;

class NestedPageRoute extends StatefulWidget {
  @override
  State createState() {
    return _NestedPageState();
  }
}

class _NestedPageState extends State with SingleTickerProviderStateMixin {
  refresh.RefreshController _refreshController =
      refresh.RefreshController(initialRefresh: true);
  refresh.RefreshController _refreshController2 =
      refresh.RefreshController(initialRefresh: true);
  ScrollController _scrollviewController = ScrollController();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  List list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: RefreshIndicator(
          notificationPredicate: (notifation) {
            // 返回true即可
            return true;
          },
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {
              print("我是调用的外部刷新0");
              return true;
            });
          },
          child: NestedScrollView(
              controller: _scrollviewController,
              headerSliverBuilder: (context, boxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    elevation: 0.5,
                    forceElevated: true,
                    expandedHeight: 240,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin, //视差效果
                      background: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 190,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                    bottom: TabBar(controller: _tabController, tabs: [
                      Tab(
                        text: "首页",
                      ),
                      Tab(
                        text: "消息",
                      ),
                      Tab(
                        text: "购物",
                      ),
                      Tab(
                        text: "我的",
                      )
                    ]),
                  ),
                ];
              },
              body: TabBarView(controller: _tabController, children: [
                refresh.SmartRefresher(
                  controller: _refreshController,
                  onRefresh: () => _onRefresh(_refreshController),
                  onLoading: () => _onLoading(_refreshController, list1),
                  enablePullDown: false,
                  enablePullUp: true,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(list1[index].toString()),
                      );
                    },
                    itemCount: list1.length,
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                refresh.SmartRefresher(
                  controller: _refreshController2,
                  onRefresh: () => _onRefresh(_refreshController2),
                  onLoading: () => _onLoading(_refreshController2, list2),
                  enablePullDown: false,
                  enablePullUp: true,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list2[index].toString()),
                      );
                    },
                    itemCount: list2.length,
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                Center(
                  child: Text("three"),
                ),
                Center(
                  child: Text("four"),
                ),
              ]))),
      // )
    );
  }

  void _onRefresh(refresh.RefreshController controller) async {
    await Future.delayed(Duration(seconds: 2));
    controller.refreshCompleted();
    setState(() {
      print("我是调用的内部刷新1");
    });
  }

  void _onLoading(refresh.RefreshController controller, List listData) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List list2 = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
      listData.addAll(list2);
      print("我是调用的内部加载1");
    });
    controller.loadComplete();
  }
}
