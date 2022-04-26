import 'package:my_base/my_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MYRefreshController extends IMYRefreshController {
  final RefreshController _refreshController;

  MYRefreshController(this._refreshController);

  @override
  void loadComplete() => _refreshController.loadComplete();

  @override
  void loadFailed() => _refreshController.loadFailed();

  @override
  void loadNoData() => _refreshController.loadNoData();




  @override
  void refreshFailed() => _refreshController.refreshFailed();

  @override
  void dispose() => _refreshController.dispose();

  @override
  void refreshCompleted({bool resetFooterState = false}) =>
      _refreshController.refreshCompleted(resetFooterState: resetFooterState);
}
