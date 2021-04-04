class Video {
  final String id;
  final String title;
  final String description;
  final String discipline;
  final String parentalRating;
  final String url;
  final String platform;
  final String owner;
  final String semester;
  final String course;
  final int duration;
  final bool isIndependent;
  final DateTime createdAt;
  final List<String> tags;
  final List<String> comments;
  final List<String> cast;
  final List<String> members;

  Video(
      {this.id,
      this.title,
      this.description,
      this.discipline,
      this.parentalRating,
      this.url,
      this.platform,
      this.owner,
      this.semester,
      this.course,
      this.duration,
      this.isIndependent,
      this.createdAt,
      this.tags,
      this.comments,
      this.cast,
      this.members});

  factory Video.fromJson(Map<String, dynamic> parsedJson) {
    List<String> _tags = parsedJson['tags'].map<String>((tag) => tag.toString()).toList();
    List<String> _comments = parsedJson['comments'].map<String>((tag) => tag.toString()).toList();
    List<String> _cast = parsedJson['cast'].map<String>((tag) => tag.toString()).toList();
    List<String> _members = parsedJson['members'].map<String>((tag) => tag.toString()).toList();
    
    return Video(
        id: parsedJson['_id'] as String,
        title: parsedJson['title'] as String,
        description: parsedJson['description'] as String,
        parentalRating: parsedJson['parentalRating'] as String,
        url: parsedJson['url'] as String,
        platform: parsedJson['platform'] as String,
        owner: parsedJson['owner'] as String,
        semester: parsedJson['semester'] as String,
        course: parsedJson['course'] as String,
        duration: parsedJson['duration'] as int,
        isIndependent: parsedJson['isIndependent'] as bool,
        createdAt: DateTime.parse(parsedJson['createdAt']),
        tags: _tags,
        comments: _comments,
        cast: _cast,
        members: _members
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['parentalRating'] = parentalRating;
    data['url'] = url;
    data['platform'] = platform;
    data['owner'] = owner;
    data['semester'] = semester;
    data['course'] = course;
    data['duration'] = duration;
    data['isIndependent'] = isIndependent;
    data['createdAt'] = createdAt.toIso8601String();
    data['tags'] = tags;
    data['comments'] = comments;
    data['cast'] = cast;
    data['members'] = members;

    return data;
  }
}
