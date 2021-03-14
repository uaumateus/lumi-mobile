import 'package:lumi/core/domain/entities/video.dart';

abstract class VideoRepository {
  Future<List<Video>> listVideos();
}
