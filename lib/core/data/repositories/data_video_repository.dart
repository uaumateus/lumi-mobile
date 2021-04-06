import 'dart:convert';

import 'package:lumi/core/domain/entities/video_entity.dart';
import 'package:lumi/core/domain/repositories/video_repository.dart';
import 'package:lumi/network/network.dart';

class DataVideoRepository extends VideoRepository {
  static Network _network;

  // singleton impl
  static DataVideoRepository _instance = DataVideoRepository._internal();

  DataVideoRepository._internal();

  factory DataVideoRepository({Network network}) {
    _network = network ?? Network();
    return _instance;
  }

  @override
  Future<List<Video>> listVideos({int limit = 10}) async {
    final response = await _network.get('videos');
    final decoded = jsonDecode(response).cast<Map<String, dynamic>>();

    List<Video> videos =
        decoded.map<Video>((video) => Video.fromJson(video)).toList();

    return videos;
  }
}
