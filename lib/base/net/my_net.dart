import 'package:my_app_demo/base/view_model/base_view_model_mixin.dart';
import 'package:my_net_lib/my_net_lib.dart';


import 'my_http_interceptor.dart';

///网络配置
///
final MYHttp myHttp = MYHttp()
  ..baseUrl = "https://api.github.com"
  ..connectTimeout = 5000
  ..interceptors.add(MYInterceptor())
  ..proxyIp = ''
  ..receiveTimeout = 5000;

///net 代理类
///
class MYNetMixinProxy with MYBaseNetMixin, MYBaseViewModelMixin {}

///网络请求mixin类
///
class MyNetMixin implements MYBaseNetMixin {
  final MYNetMixinProxy _myNextMixin = MYNetMixinProxy();

  @override
  void hideLoading() => _myNextMixin.hideLoading();

  @override
  MYHttp httpClient() => _myNextMixin.httpClient();

  @override
  void showLoading() => _myNextMixin.showLoading();

  @override
  void showToast(String msg) => _myNextMixin.showToast(msg);

  @override
  Future doGet(api, {params, withLoading = true, withRefreshComplete = false}) {
    return _myNextMixin.doGet(api,
        params: params,
        withLoading: withLoading,
        withRefreshComplete: withRefreshComplete);
  }

  @override
  void resultError(String errorMsg) => _myNextMixin.resultError(errorMsg);

  @override
  Future doPost(api, {params, data, withLoading = true, Options options}) {
    return _myNextMixin.doPost(api,
        params: params, data: data, withLoading: withLoading, options: options);
  }
}
