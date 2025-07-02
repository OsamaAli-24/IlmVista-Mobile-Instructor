import 'package:lms_user_app/data/model/course_detail/progress.dart';

class Lesson {
  int? id;
  String? title;
  String? description;
  String? type;
  String? duration;
  bool? isFree;
  String? thumbnail;
  String? source;
  String? link;
  bool? is_complete;
  Progress? progress;

  Lesson(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.duration,
      this.isFree,
      this.thumbnail,
      this.source,
      this.link,
      this.is_complete,
      this.progress});

  factory Lesson.fromJson(Map<String, Object?> json) => Lesson(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      duration: json['duration'] as String?,
      isFree: json['is_free'] as bool?,
      thumbnail: json['thumbnail'] as String?,
      source: json['source'] as String?,
      link: json['link'] as String?,
      is_complete: json['is_complete'] as bool?,
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress']! as Map<String, Object?>));

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'duration': duration,
        'is_free': isFree,
      };
}
