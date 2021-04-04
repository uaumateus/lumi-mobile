import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/data/repositories/data_video_repository.dart';
import 'package:lumi/pages/home/home_controller.dart';
import 'package:lumi/widgets/lumi_card_film_widget.dart';
import 'package:lumi/widgets/lumi_card_list_widget.dart';
import 'package:lumi/widgets/lumi_default_view_widget.dart';

class HomePage extends View {
  final Controller controller;

  HomePage({Key key, this.controller}) : super(key: key);

  @override
  _HomePageState createState() =>
      _HomePageState(HomeController(DataVideoRepository()));
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

  @override
  Widget get view {
    return LumiDefaultView(key: globalKey, children: [
      Container(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ControlledWidgetBuilder<HomeController>(
                  builder: (_, controller) {
                if (!controller.isLoading)
                  return LumiCardList(
                      title: 'Os mais assistidos',
                      cards: controller.videos
                          .map((video) => LumiCardFilm(title: video.title, subtitle: video.discipline))
                          .toList());

                return Container();
              })))
    ]);
  }
}
