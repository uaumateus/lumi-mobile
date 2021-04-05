import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/core/domain/entities/video_entity.dart';

void main() {
  final videoMap = {
    "tags": [],
    "comments": [],
    "cast": [],
    "isIndependent": true,
    "parentalRating": "Livre",
    "_id": "5f88bc9ce3b76a1834228db1",
    "platform": "Youtube",
    "url": "hueheh",
    "duration": 23,
    "description": "bbbb",
    "title": "AAA",
    "owner": "Alunx",
    "event": "5ed94073a5729917ecf6d9e4",
    "semester": "2021.1",
    "course": "SMD",
    "createdAt": "2020-10-15T21:18:20.181Z",
    "updatedAt": "2020-10-15T21:18:20.181Z",
    "members": []
  };

  Video _video = Video(
      id: videoMap['_id'],
      title: videoMap['title'],
      description: videoMap['description'],
      parentalRating: videoMap['parentalRating'],
      url: videoMap['url'],
      platform: videoMap['platform'],
      owner: videoMap['owner'],
      semester: videoMap['semester'],
      course: videoMap['course'],
      duration: videoMap['duration'],
      isIndependent: videoMap['isIndependent'],
      createdAt: DateTime.parse(videoMap['createdAt']));

  final videoFromJson = Video.fromJson(videoMap);
  final videoToJson = Video.fromJson(videoMap).toJson();

  test('fromJson test', () async {
    expect(videoFromJson.title, _video.title);
    expect(videoFromJson.url, _video.url);
    expect(videoFromJson.course, _video.course);
    expect(videoFromJson.createdAt, _video.createdAt);
    expect(videoFromJson.description, _video.description);
    expect(videoFromJson.duration, _video.duration);
    expect(videoFromJson.id, _video.id);
    expect(videoFromJson.isIndependent, _video.isIndependent);
    expect(videoFromJson.owner, _video.owner);
    expect(videoFromJson.parentalRating, _video.parentalRating);
    expect(videoFromJson.platform, _video.platform);
    expect(videoFromJson.semester, _video.semester);
  });

  test('toJson test', () async {
    expect(videoToJson['title'], _video.title);
    expect(videoToJson['url'], _video.url);
    expect(videoToJson['course'], _video.course);
    expect(videoToJson['description'], _video.description);
    expect(videoToJson['duration'], _video.duration);
    expect(videoToJson['_id'], _video.id);
    expect(videoToJson['isIndependent'], _video.isIndependent);
    expect(videoToJson['owner'], _video.owner);
    expect(videoToJson['parentalRating'], _video.parentalRating);
    expect(videoToJson['platform'], _video.platform);
    expect(videoToJson['semester'], _video.semester);
  });

  test('isInstanceOf test', () async {
    expect(videoFromJson.title, isInstanceOf<String>());
    expect(videoFromJson.url, isInstanceOf<String>());
    expect(videoFromJson.course, isInstanceOf<String>());
    expect(videoFromJson.createdAt, isInstanceOf<DateTime>());
    expect(videoFromJson.description, isInstanceOf<String>());
    expect(videoFromJson.duration, isInstanceOf<int>());
    expect(videoFromJson.id, isInstanceOf<String>());
    expect(videoFromJson.isIndependent, isInstanceOf<bool>());
    expect(videoFromJson.owner, isInstanceOf<String>());
    expect(videoFromJson.parentalRating, isInstanceOf<String>());
    expect(videoFromJson.platform, isInstanceOf<String>());
    expect(videoFromJson.semester, isInstanceOf<String>());
  });
}
