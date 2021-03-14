import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/usecases/video/list_videos_usecase.dart';
import 'package:lumi/pages/home/home_presenter.dart';

class ListVideosUseCaseObserver
    extends Observer<ListVideosUseCaseResponse> {
  final HomePresenter presenter;

  ListVideosUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.listVideosOnComplete != null);
    presenter.listVideosOnComplete();
  }

  @override
  void onError(error) {
    assert(presenter.listVideosOnError != null);
    presenter.listVideosOnError(error);
  }

  @override
  void onNext(response) {
    assert(presenter.listVideosOnNext != null);
    presenter.listVideosOnNext(response.videos);
  }
}
