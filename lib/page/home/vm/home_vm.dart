import 'dart:math';
import 'package:my_app_demo/base/view_model/my_list_view_model.dart';
import 'package:my_app_demo/page/home/bean/home_bean.dart';

class HomeVM extends MYListViewModel<String> {
  @override
  Future<List<String>> getListData({int pageNum}) async {
    if (pageNum == 1) {
      await Future.delayed(Duration(seconds: 1));
      if (Random().nextInt(2) == 1) {
        return Future.value([]);
      }
    }
    if (pageNum == 4) {
      return Future.delayed(Duration(seconds: 1), () {
        return List.generate(4, (i) => '我是第$pageNum页第$i条');
      });
    } else if (pageNum == 3) {
      return Future.error('错误了');
    } else {
      return Future.delayed(Duration(seconds: 1), () {
        return List.generate(21, (i) => '我是第$pageNum页第$i条');
      });
    }
  }

  getData() async {
    // https://github.com/google/json_serializable.dart/issues/779
    // https://github.com/dart-lang/language/issues/356
    ///改该方法行不通，dart为了静态类型、拓展类型安全，不允许泛型直接转成一个具体类型
    // var resp = await doPost<BaseBean<HomeBean>>('/gw/api/order/getOrderList/new', data: {});

    var resp = await doPost('/gw/api/order/getOrderList/new', data: {});
    var homeBean = HomeBean.fromJson(resp);
    homeBean.dataList.forEach((element) {});
  }
}
