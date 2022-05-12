import 'package:my_app_demo/base/view_model/my_list_view_model.dart';
import 'package:my_app_demo/base/view_model/my_refresh_controll.dart';
import 'package:my_vm_lib/my_vm_lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GoodsViewModel extends MYListViewModel {
  RefreshController refreshController = RefreshController();

  int selectIndex = 0;

  void setIndex(int index) {
    selectIndex = index;
    notifyListeners();
  }

  @override
  IMYRefreshController getRefreshController() {
    return MYRefreshController(refreshController);
  }

  @override
  Future<List> getListData({int pageNum}) {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(20, (i) {
        return '$i';
      });
    });
  }
}
