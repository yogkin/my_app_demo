import 'package:my_net_lib/my_net_lib.dart';

/// id : null
/// remark : "热搜头图文字图配置"
/// sysKey : "HOT_SEARCH_TOP_PIC_FONT_CONFIG"
/// sysValue : "http://miyuan-static.oss-cn-shenzhen.aliyuncs.com/zhitu-api/1608022540346763.png"
/// status : null
/// updateTime : null
/// version : null
// {
// 		"id": null,
// 		"remark": "热搜头图文字图配置",
// 		"sysKey": "HOT_SEARCH_TOP_PIC_FONT_CONFIG",
// 		"sysValue": "http://miyuan-static.oss-cn-shenzhen.aliyuncs.com/zhitu-api/1608022540346763.png",
// 		"status": null,
// 		"updateTime": null,
// 		"version": null
// 	}

class HomeBean with MYNetBeanMixin {
  HomeBean({
    this.id,
    this.remark,
    this.sysKey,
    this.sysValue,
    this.status,
    this.updateTime,
    this.version,
  });

  HomeBean.fromJson(dynamic json) {
    id = json['id'];
    remark = json['remark'];
    sysKey = json['sysKey'];
    sysValue = json['sysValue'];
    status = json['status'];
    updateTime = json['updateTime'];
    version = json['version'];
  }

  dynamic id;
  String remark;
  String sysKey;
  String sysValue;
  dynamic status;
  dynamic updateTime;
  dynamic version;

  HomeBean copyWith({
    dynamic id,
    String remark,
    String sysKey,
    String sysValue,
    dynamic status,
    dynamic updateTime,
    dynamic version,
  }) =>
      HomeBean(
        id: id ?? this.id,
        remark: remark ?? this.remark,
        sysKey: sysKey ?? this.sysKey,
        sysValue: sysValue ?? this.sysValue,
        status: status ?? this.status,
        updateTime: updateTime ?? this.updateTime,
        version: version ?? this.version,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['remark'] = remark;
    map['sysKey'] = sysKey;
    map['sysValue'] = sysValue;
    map['status'] = status;
    map['updateTime'] = updateTime;
    map['version'] = version;
    return map;
  }

  @override
  fromJson(json) => HomeBean.fromJson(json);
}
