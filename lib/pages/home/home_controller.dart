import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/repositories/video_repository.dart';

import './home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter presenter;

  HomeController(VideoRepository videoRepository)
      : presenter = HomePresenter(videoRepository),
        super();

  @override
  void onInitState() {
    super.onInitState();
    fetchVideos();
  }

  @override
  void initListeners() {
    _initializeListVideosListener();
  }

  void fetchVideos() {
    presenter.listVideos();
  }

  _initializeListVideosListener() {
    presenter.listVideosOnNext = (videos) {};
    presenter.listVideosOnComplete = () {
    };
    presenter.listVideosOnError = (error) {
      print(error);
    };
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
