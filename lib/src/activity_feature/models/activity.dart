// ignore_for_file: constant_identifier_names

import 'package:knowabunga_app/src/utils/string_extensions.dart';

enum ActivityType {
  talk,
  discussion_panel,
  food_and_drinks,
  sport,
  general,
}

enum ActivityDay {
  day1,
  day2,
}

class Activity {
  Activity({
    this.day = ActivityDay.day1,
    required this.timeStart,
    required this.timeEnd,
    required this.location,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.speakers,
    required this.type,
  });

  final ActivityDay day;
  final String timeStart;
  final String timeEnd;
  final String location;
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final List<String> speakers;
  final ActivityType type;

  String get tag => '${day.name} $timeStart $timeEnd $title';

  String get friendlyType => type.name.replaceAll('_', ' ').capitalize();

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      day: Activity.parseActivityDay(json['day']),
      timeStart: json['time_start'],
      timeEnd: json['time_end'],
      location: json['location'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      tags: List<String>.from(json['tags']),
      speakers: List<String>.from(json['speakers']),
      type: Activity.parseActivityType(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day.name,
      'time_start': timeStart,
      'time_end': timeEnd,
      'location': location,
      'title': title,
      'description': description,
      'image': image,
      'tags': tags,
      'speakers': speakers,
      'type': type.name,
    };
  }

  static ActivityDay parseActivityDay(String day) {
    return ActivityDay.values.firstWhere(
      (ActivityDay e) => e.toString() == 'ActivityDay.$day',
    );
  }

  static ActivityType parseActivityType(String type) {
    return ActivityType.values.firstWhere(
      (ActivityType e) => e.toString() == 'ActivityType.$type',
    );
  }
}
