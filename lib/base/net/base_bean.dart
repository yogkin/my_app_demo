import 'package:my_net_lib/my_net_lib.dart';

/// msg : "请求成功"
/// data : {"id":null,"remark":"热搜头图文字图配置","sysKey":"HOT_SEARCH_TOP_PIC_FONT_CONFIG","sysValue":"http://miyuan-static.oss-cn-shenzhen.aliyuncs.com/zhitu-api/1608022540346763.png","status":null,"updateTime":null,"version":null}
/// code : "B00000"

///网络请求数据解析
///[T] 为需要解析的实体类，需要继承[MYNetBeanMixin]
///
///
class BaseBean<T extends MYNetBeanMixin> {
  BaseBean({
    String msg,
    T data,
    String code,
  }) {
    _msg = msg;
    _data = data;
    _code = code;
  }

  String _msg;
  dynamic _data;
  String _code;

  String get msg => _msg;

  dynamic get data => _data;

  String get code => _code;

  bool get isSuccess => code == '0';

  BaseBean.fromJson(json) {
    _msg = json['msg'];
    _data = json['data'] ?? '';
    _code = json['code'];
  }

  Map<String, T> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    map['code'] = _code;
    return map;
  }
}
