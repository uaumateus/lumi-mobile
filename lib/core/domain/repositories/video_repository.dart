import 'package:lumi/core/domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<List<Video>> listVideos({int limit});
}
