import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/core/data/repositories/data_video_repository.dart';
import 'package:lumi/core/domain/entities/video.dart';
import 'package:lumi/network/network.dart';
import 'package:mockito/mockito.dart';

class MockNetwork extends Mock implements Network {}

void main() {
  MockNetwork mockNetwork = MockNetwork();

  final listVideoMap =
      '[{"tags":[],"comments":[],"cast":[],"isIndependent":true,"parentalRating":"Livre","_id":"5f88bc9ce3b76a1834228db1","platform":"Youtube","url":"hueheh","duration":23,"description":"bbbb","title":"AAA","owner":null,"event":"5ed94073a5729917ecf6d9e4","semester":null,"course":null,"createdAt":"2020-10-15T21:18:20.181Z","updatedAt":"2020-10-15T21:18:20.181Z","__v":0,"members":[]}]';

  Video _video = Video.fromJson(
      jsonDecode(listVideoMap).cast<Map<String, dynamic>>().first);

  group('Data video repository test group', () {
    setUp(() {
      when(mockNetwork.get('videos'))
          .thenAnswer((_) => Future.value(listVideoMap));
    });

    test('Test of listVideos()', () async {
      List<Video> videos =
          await DataVideoRepository(network: mockNetwork).listVideos(limit: 10);
      verify(mockNetwork.get('videos'));

      expect(videos.first.title, _video.title);
      expect(videos.first.url, _video.url);
      expect(videos.first.cast, _video.cast);
      expect(videos.first.comments, _video.comments);
      expect(videos.first.course, _video.course);
      expect(videos.first.createdAt, _video.createdAt);
      expect(videos.first.description, _video.description);
      expect(videos.first.duration, _video.duration);
      expect(videos.first.id, _video.id);
      expect(videos.first.isIndependent, _video.isIndependent);
      expect(videos.first.members, _video.members);
      expect(videos.first.owner, _video.owner);
      expect(videos.first.parentalRating, _video.parentalRating);
      expect(videos.first.platform, _video.platform);
      expect(videos.first.semester, _video.semester);
      expect(videos.first.tags, _video.tags);
    });
  });
}
