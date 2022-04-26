import 'package:my_app_demo/base/net/my_net.dart';
import 'package:my_app_demo/utils/loading_utils.dart';
import 'package:my_base/my_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'my_refresh_controll.dart';

class MYBaseViewModelMixin {

  RefreshController refreshController = RefreshController();

  MYHttp httpClient() => myHttp;

  void hideLoading() => LoadingUtils.hideLoading();

  void showLoading() => LoadingUtils.showLoading();

  void showToast(String msg) => LoadingUtils.showToast(msg);

  IMYRefreshController getRefreshController() {
    return MYRefreshController(refreshController);
  }
}
