import 'package:my_app_demo/base/net/my_net.dart';
import 'package:my_app_demo/utils/loading_utils.dart';
import 'package:my_net_lib/my_net_lib.dart';

class MYBaseViewModelMixin {

  MYHttp httpClient() => myHttp;

  void hideLoading() => LoadingUtils.hideLoading();

  void showLoading() => LoadingUtils.showLoading();

  void showToast(String msg) => LoadingUtils.showToast(msg);


}
