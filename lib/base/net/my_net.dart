import 'dart:convert';
import 'package:my_app_demo/base/net/base_bean.dart';
import 'package:my_app_demo/base/view_model/base_view_model_mixin.dart';
import 'package:my_net_lib/my_net_lib.dart';

import 'my_http_interceptor.dart';

///网络配置
///
final MYHttp myHttp = MYHttp()
  ..baseUrl = "http://uat03.miyuan.com"
  ..connectTimeout = 5000
  ..interceptors.add(MYInterceptor())
  ..proxyIp = '192.168.137.1:8888'
  ..receiveTimeout = 5000
  ..build();

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
  Future doGet(api,
      {params, withLoading = true, Function(BaseBean) dealResponse}) async {
    var resp =
    await _myNextMixin.doGet(api, params: params, withLoading: withLoading);
    BaseBean baseBean = BaseBean.fromJson(jsonDecode(resp));
    if (dealResponse != null) {
      dealResponse(baseBean);
    } else {

    }
    return baseBean.data;
  }

  @override
  void resultError(String errorMsg) => _myNextMixin.resultError(errorMsg);

  @override
  Future doPost(api, {
    params,
    data,
    withLoading = true,
    Options options,
    Function(BaseBean) dealResponse,
  }) async {
    var resp = await _myNextMixin.doPost(api,
        params: params, data: data, withLoading: withLoading, options: options);

    ///不能使跟进泛型T直接转成具体类型。
    ///
    ///https://github.com/dart-lang/language/issues/356
    ///https://github.com/google/json_serializable.dart/issues/779
    // BaseBean baseBean = T.fromJson(jsonDecode(resp));
    // 会报错 ： Unhandled Exception: type '_Type' is not a subtype of type 'MYNetBeanMixin' in type cast
    BaseBean baseBean = BaseBean.fromJson(jsonDecode(resp));
    if (dealResponse != null) {
      dealResponse(baseBean);
    } else {
      baseBean.code=='BB';
    }
    return baseBean.data;
  }
}
