
import 'package:my_app_demo/base/net/aes.dart';
import 'package:my_net_lib/my_net_lib.dart';

class MYInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers ??= <String, dynamic>{};
    options.headers.addAll({'version': '6350', ...Aes.getHeaderParams()});
    super.onRequest(options, handler);
  }
}
