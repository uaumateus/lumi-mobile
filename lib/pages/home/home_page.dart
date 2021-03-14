import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/data/repositories/data_video_repository.dart';
import 'package:lumi/pages/home/home_controller.dart';

class HomePage extends View {
  final Controller controller;

  HomePage({Key key, this.controller}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(HomeController(DataVideoRepository()));
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Container(child: Text('Home'))
    );
  }
}
