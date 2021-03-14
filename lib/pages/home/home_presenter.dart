import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/repositories/video_repository.dart';
import 'package:lumi/core/domain/usecases/video/list_videos_usecase.dart';
import 'package:lumi/pages/home/observers/observers.dart';

class HomePresenter extends Presenter {
  Function listVideosOnNext;
  Function listVideosOnComplete;
  Function listVideosOnError;

  ListVideosUseCase listVideosUseCase;

  HomePresenter(VideoRepository videoRepository) {
    listVideosUseCase = ListVideosUseCase(videoRepository);
  }

  void listVideos() {
    listVideosUseCase.execute(
        ListVideosUseCaseObserver(this), ListVideosUseCaseParams());
  }

  @override
  void dispose() {
    listVideosUseCase.dispose();
  }
}
