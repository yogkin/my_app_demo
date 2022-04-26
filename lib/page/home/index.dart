import 'package:flutter/material.dart';
import 'package:my_app_demo/function/refresh/my_refresh.dart';
import 'package:my_app_demo/page/home/vm/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_app_demo/utils/ext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeVM _viewModel = HomeVM();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123'),
      ),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, child) {
          return MYRefresh(
            listViewModel: _viewModel,
            child: ListView.builder(
              itemCount: context.watch<HomeVM>().list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(_viewModel.list[index].substring(0, 1)),
                  ),
                  title: Text(_viewModel.list[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
