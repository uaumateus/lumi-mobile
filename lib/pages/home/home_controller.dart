import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/entities/video.dart';
import 'package:lumi/core/domain/repositories/video_repository.dart';

import './home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter presenter;

  List<Video> _videos = [];
  List<Video> get videos => _videos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  void _setLoading(bool value) {
    _isLoading = value;
    refreshUI();
  }

  void fetchVideos() {
    _setLoading(true);
    
    presenter.listVideos();
  }

  _initializeListVideosListener() {
    presenter.listVideosOnNext = (videos) {
      _videos = videos;
    };
    presenter.listVideosOnComplete = () {
      _setLoading(false);
    };
    presenter.listVideosOnError = (error) {
      print(error);

      _setLoading(false);
    };
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
