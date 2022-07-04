
import 'package:flutter/material.dart';
import 'package:my_app_demo/page/goods_detail/widget/view_page_widget.dart';
import 'package:provider/provider.dart';

import 'view_model/goods_vm.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '推荐'),
    Tab(text: '蜜粉圈'),
    Tab(text: '京东'),
    Tab(text: '唯品会'),
  ];

  ScrollController _scrollviewController = ScrollController();

  TabController _tabController;

  GoodsViewModel _goodsViewModel = GoodsViewModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(() {
      debugPrint('_tabController.index${_tabController.index}');
      _goodsViewModel.setIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        child: ChangeNotifierProvider.value(
          value: _goodsViewModel,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: Container(),
                  title: Text('商品详情'),
                  centerTitle: true,
                  pinned: true,
                ),
                SliverToBoxAdapter(
                    child: Container(
                  height: 100,
                  color: Colors.red,
                )),
                SliverToBoxAdapter(
                    child: Container(
                  height: 100,
                  color: Colors.green,
                )),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    child: TabBar(
                      labelColor: Colors.black,
                      controller: _tabController,
                      tabs: myTabs,
                    ),
                  ),
                ),
              ];
            },
            body: Builder(builder: (context) {
              return TabBarView(
                controller: _tabController,
                children: [
                  ViewPageWidget(
                    needLoadMore: context.select(
                            (GoodsViewModel value) => value.selectIndex) ==
                        0,
                    scrollviewController: _scrollviewController,
                  ),
                  ViewPageWidget(
                    needLoadMore: context.select(
                            (GoodsViewModel value) => value.selectIndex) ==
                        1,
                    scrollviewController: _scrollviewController,
                  ),
                  ViewPageWidget(
                    needLoadMore: context.select(
                            (GoodsViewModel value) => value.selectIndex) ==
                        2,
                    scrollviewController: _scrollviewController,
                  ),
                  ViewPageWidget(
                    needLoadMore: context.select(
                            (GoodsViewModel value) => value.selectIndex) ==
                        3,
                    scrollviewController: _scrollviewController,
                  )
                ],
              );
            }),
          ),
        ),
      )),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
