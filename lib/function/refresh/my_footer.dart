import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 刷新头部
///
class MYRefreshFooter extends ClassicFooter {
  MYRefreshFooter()
      : super(
          idleText: '上拉加载',
          loadingText: '加载中',
          noDataText: '没有更多数据了!',
          failedText: '加载失败！点击重试！',
          canLoadingText: '松手,加载更多!',
        );
}
