import 'package:my_app_demo/base/net/my_net.dart';
import 'package:my_vm_lib/my_vm_lib.dart';
import 'base_view_model_mixin.dart';

/// 蜜源App ViewModel 基类
///
///
class MYViewSateModel extends MYBaseViewModel
    with MYBaseViewModelMixin, MyNetMixin {}
