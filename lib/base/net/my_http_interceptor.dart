
import 'package:my_net_lib/my_net_lib.dart';

class MYInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    response.headers ??= Headers();
    response.headers..add('version', '6350');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}
