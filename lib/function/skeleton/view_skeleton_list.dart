import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app_demo/utils/ext.dart';


/// 列表鱼骨样式


class ViewSkeletonListPage extends StatefulWidget {
  @override
  _ViewSkeletonListState createState() => _ViewSkeletonListState();
}

class _ViewSkeletonListState extends State<ViewSkeletonListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (_, __) => ItemViewSkeletonListPage(),
        itemCount: 10,
      ),
    );
  }
}

//单个 鱼骨
Widget ItemViewSkeletonListPage() {
  return Container(
      color: Color(0xFFF8F8F8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        margin: EdgeInsets.only(top: 10, right: 13, left: 13),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Container(
                width: 220.w,
                height: 220.w,
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F7F9),
                    borderRadius:
                        BorderRadius.all(Radius.circular(12.w))),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // 对齐方式: 居中对齐   默认为center(居中对齐)
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30.w,
                        width: 30.w,
                        margin: EdgeInsets.only(right: 10.w),
                        color:Color(0xFFF5F7F9),
                      ),
                      Expanded(
                        child: Container(
                          height: 30.w,
                          margin: EdgeInsets.only(right: 30.w),
                          color: Color(0xFFF5F7F9),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 12.w, right: 100.w),
                    height: 30.w,
                    color: Color(0xFFF5F7F9),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30.w,
                        width: 130.w,
                        margin: EdgeInsets.only(
                            top: 12.w, right: 10.w),
                        color: Color(0xFFF5F7F9),
                      ),
                      Container(
                        height: 30.w,
                        width: 130.w,
                        margin: EdgeInsets.only(
                            top: 12.w, right:30.w),
                        color: const Color(0xFFF5F7F9),
                      ),
                    ],
                  ),
                  Container(
                    height: 100.w,
                  )
                ],
              ),
            )
          ],
        ),
      ));
}
