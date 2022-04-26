import 'dart:math';

import 'package:my_app_demo/base/view_model/my_list_view_model.dart';

class HomeVM extends MYListViewModel<String> {
  @override
  Future<List<String>> getListData({int pageNum}) async{
    if (pageNum == 1) {
      await Future.delayed(Duration(seconds: 1));
      if (Random().nextInt(2)==1) {
        return Future.value([]);
      }
    }
    if (pageNum == 3) {
      return Future.delayed(Duration(seconds: 1), () {
        return List.generate(4, (i) => '我是第$pageNum页第$i条');
      });
    } else {
      return Future.delayed(Duration(seconds: 1), () {
        return List.generate(21, (i) => '我是第$pageNum页第$i条');
      });
    }

  }

  getData() {
    doGet('api').then((value) {
      print(value);
    });
  }
}
