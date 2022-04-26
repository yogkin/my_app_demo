import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 刷新头部
///
class MYRefreshHeader extends CustomHeader {
  MYRefreshHeader()
      : super(
            height: 100,
            builder: (context, mode) {
              if (mode == RefreshStatus.idle) {
                return null;
              } else {
                return Container(
                  alignment: Alignment.bottomCenter,
                  height: 80.0,
                  child: Center(
                    child: Image.asset(
                      'assets/img/mjCustomGifImage.gif',
                    ),
                  ),
                );
              }
            });
}
