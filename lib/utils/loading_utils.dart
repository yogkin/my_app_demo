
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 弹窗 类
///
class LoadingUtils {
  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.dark
      ..userInteractions = false
      ..indicatorSize = 45.0;
    return EasyLoading.init();
  }

  //显示loading ，单例全局可用
  static showLoading() => EasyLoading.show(status: '加载中...');

  //隐藏loading
  static hideLoading() => EasyLoading.dismiss();

  //toast
  static showToast(String msg, {bool canDismiss = true}) =>
      EasyLoading.showToast(msg, dismissOnTap: canDismiss);
}
