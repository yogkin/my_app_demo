import 'package:my_app_demo/base/net/my_net.dart';
import 'package:my_base/my_base.dart';

import 'base_view_model_mixin.dart';

///蜜源 列表页面的ViewModel 基类，包括下拉刷新，上拉加载更多，网络请求等
///
///
abstract class MYListViewModel<T> extends MYBaseListViewModel<T>
    with MYBaseViewModelMixin, MyNetMixin {}
