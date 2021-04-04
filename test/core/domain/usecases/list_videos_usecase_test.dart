import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/core/data/repositories/data_video_repository.dart';
import 'package:lumi/core/domain/entities/video.dart';
import 'package:lumi/core/domain/usecases/video/list_videos_usecase.dart';
import 'package:mockito/mockito.dart';

class MockVideoRepository extends Mock implements DataVideoRepository {}

void main() {
  Video _video =
      Video(title: 'As branquelas', discipline: 'Narrativas Multimidia');
  var params = ListVideosUseCaseParams(limit: 10);
  ListVideosUseCaseObserver observer;
  final repository = MockVideoRepository();
  ListVideosUseCase usecase = ListVideosUseCase(repository);

  when(repository.listVideos(limit: 10)).thenAnswer((_) => Future.value([_video]));

  setUp(() {
    observer = ListVideosUseCaseObserver();
  });

  group('Domain module', () {
    test('UseCase onNext and onDone.', () async {
      usecase.execute(observer, params);

      await Future.delayed(Duration(milliseconds: 1000), () {
        expect(observer.onnext, true);
        expect(observer.done, true);
        expect(observer.error, false);
        expect(observer.response, isInstanceOf<List<Video>>());
        expect(observer.response, [_video]);
      });
    });

    test('UseCase .OnError.', () async {
      usecase.execute(observer);

      await Future.delayed(Duration(milliseconds: 1000), () {
        expect(observer.onnext, false);
        expect(observer.done, false);
        expect(observer.error, true);
        expect(observer.response, null);
      });
    });

    test('UseCase .dispose cancels the subscription', () async {
      await Future.delayed(Duration(milliseconds: 15), () {
        usecase.execute(observer, params);
        usecase.dispose();

        expect(observer.onnext, false);
        expect(observer.done, false);
        expect(observer.error, false);
        expect(observer.response, null);
      });
    });
  });
}

class ListVideosUseCaseObserver extends Observer<ListVideosUseCaseResponse> {
  bool onnext = false;
  bool done = false;
  bool error = false;
  List<Video> response;

  @override
  void onComplete() {
    done = true;
  }

  @override
  void onError(e) {
    error = true;
  }

  @override
  void onNext(ListVideosUseCaseResponse useCaseResponse) {
    response = useCaseResponse.videos;
    onnext = true;
  }
}
