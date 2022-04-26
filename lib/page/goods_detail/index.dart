import 'package:flutter/material.dart';

class GoodDetailPage extends StatelessWidget {
  const GoodDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Center(
        child: Text('商品详情'),
      ),
    );
  }
}
