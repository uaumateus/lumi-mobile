import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/entities/video.dart';
import 'package:lumi/core/domain/repositories/video_repository.dart';

class ListVideosUseCaseParams {
  final int limit;

  ListVideosUseCaseParams({this.limit});
}

class ListVideosUseCaseResponse {
  final List<Video> videos;

  ListVideosUseCaseResponse(this.videos);
}

class ListVideosUseCase extends UseCase<ListVideosUseCaseResponse, ListVideosUseCaseParams> {
  final VideoRepository videoRepository;

  ListVideosUseCase(this.videoRepository); // Constructor

  @override
  Future<Stream<ListVideosUseCaseResponse>> buildUseCaseStream(
      ListVideosUseCaseParams params) async {
    final StreamController<ListVideosUseCaseResponse> controller =
        StreamController();
    try {
      List<Video> videos = await videoRepository.listVideos(limit: params.limit);

      controller.add(ListVideosUseCaseResponse(videos));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}
