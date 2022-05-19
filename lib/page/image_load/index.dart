import 'package:flutter/material.dart';
import 'package:my_image_lib/my_image_lib.dart';

///蜜源图片加载库
///
///
class MYImagePage extends StatefulWidget {
  const MYImagePage({Key key}) : super(key: key);

  @override
  _MYImagePageState createState() => _MYImagePageState();
}

class _MYImagePageState extends State<MYImagePage> {
  bool isShowLocal = false;
  bool isShowNetImg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            '图片加载',
          )),
      body: ListView(
        children: <Widget>[
          OutlineButton(
              onPressed: () {
                setState(() {
                  isShowLocal = !isShowLocal;
                });
              },
              child: Text('本地资源加载')),
          OutlineButton(
              onPressed: () {
                setState(() {
                  isShowNetImg = !isShowNetImg;
                });
              },
              child: Text('图片加载')),
          SizedBox(height: 10),
          isShowLocal
              ? MyImage.asset(
                  'assets/img/test.webp',
                  width: 300,
                  height: 100,
                )
              : Container(),
          SizedBox(height: 10),
          isShowNetImg
              ? MyImage.network(
                  'https://www.baidu.com/img/bd_logo1.png',
                  width: 100,
                  height: 100,
                )
              : Container(),
        ],
      ),
    );
  }
}
