import 'package:flutter/material.dart';
import 'package:my_app_demo/function/refresh/my_refresh.dart';
import 'package:my_app_demo/page/home/vm/home_vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeVM _viewModel = HomeVM()..getListData();

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
          return MYRefresh.list(
            listViewModel: _viewModel,
            shrinkWrap: true,
            itemCount: context.watch<HomeVM>().list.length,
            itemBuilder: (BuildContext context, String item, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(item.substring(0, 1)),
                ),
                title: Text(item),
              );
            }
          );
        },
      ),
    );
  }
}
