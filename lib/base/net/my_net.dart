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
  ..proxyIp = '10.0.1.44:8888'
  ..receiveTimeout = 5000
  ..build();

///net 代理类
///[MYBaseNetMixin] 网络
///[MYBaseViewModelMixin] mvvm
///
class MYNetMixinProxy with MYBaseNetMixin, MYBaseViewModelMixin {
  ///根据蜜源返回code 处理对应业务
  ///
  Future handleResp(
      BaseBean baseBean, Function(BaseBean) handleResponse) async {
    switch (baseBean.code) {
      case "B00000":
      case "0":
        return handleResponse == null ? baseBean?.data ?? '' : baseBean;
        //成功
        break;
      case "B10019": //账号异常去登陆|
        // if (isShowError && ObjectUtil.isEmpty(message)) {
        //   ToastUtils.showToast(message);
        // }
        // MyLogUtil.dAndWriteNative("退出登录：$message", type: LoganType.NETWORD);
        // BaseFlutterBoostUtil.logout();
        break;
      case "P00501": //注销  app登出用户态  弹窗提示（原客服微信&原提示语
      case "P00503": // 封号 app登出用户态  弹窗提示（原客服微信&新的提示语）
        // BaseFlutterBoostUtil.accountSealedAndCancel(message);
        // if (errorCallback != null) {
        //   errorCallback(HttpError(statusCode, message));
        // }
        break;
      case "P00502": // 踢下线 app登出用户态
        // BaseFlutterBoostUtil.accountLogoutBySystem(message);
        // if (errorCallback != null) {
        //   errorCallback(HttpError(statusCode, message));
        // }
        break;
      default:
        // //失败
        // if (isShowError && ObjectUtil.isNotEmpty(message)) {
        //   ToastUtils.showToast(message);
        // }
        // MyLogUtil.dAndWriteNative("请求服务器出错：$message", type: LoganType.NETWORD);
        // // BaseFlutterBoostUtil.upLoadExceptionLog(category:ExceptionCategory.NET,
        // //     type: ExceptionType.API_RESPONSE_ERROR,
        // //     message: "请求服务器出错：$message");
        // if (errorCallback != null) {
        //   errorCallback(HttpError(statusCode, message));
        // }
        break;
    }
  }
}

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
      {params, withLoading = true, Function(BaseBean) handleResponse}) async {
    var resp =
        await _myNextMixin.doGet(api, params: params, withLoading: withLoading);
    BaseBean baseBean = BaseBean.fromJson(jsonDecode(resp));
    return _myNextMixin.handleResp(baseBean, handleResponse);
  }

  @override
  Future resultHttpError(int code, String errorMsg) =>
      _myNextMixin.resultHttpError(code, errorMsg);

  @override
  Future doPost(
    api, {
    params,
    data,
    withLoading = true,
    Options options,
    Function(BaseBean) handleResponse,
  }) async {
    var resp = await _myNextMixin.doPost(api,
        params: params, data: data, withLoading: withLoading, options: options);

    ///不能使用泛型T直接转成具体类型。
    ///
    ///https://github.com/dart-lang/language/issues/356
    ///https://github.com/google/json_serializable.dart/issues/779
    // BaseBean baseBean = T.fromJson(jsonDecode(resp));
    // 会报错 ： Unhandled Exception: type '_Type' is not a subtype of type 'MYNetBeanMixin' in type cast
    BaseBean baseBean = BaseBean.fromJson(jsonDecode(resp));
    return _myNextMixin.handleResp(baseBean, handleResponse);
  }
}
