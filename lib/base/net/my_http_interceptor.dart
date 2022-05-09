
import 'package:my_app_demo/base/net/aes.dart';
import 'package:my_net_lib/my_net_lib.dart';

class MYInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.headers ??= <String, dynamic>{};
    options.headers.addAll({'version': '6350', ...Aes.getHeaderParams()});
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}
