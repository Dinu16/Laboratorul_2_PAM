import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  final User user;
  @JsonKey(name: 'continueWatching')
  final List<Course> continueWatching;
  final List<Category> categories;
  final List<Course> suggestions;
  @JsonKey(name: 'topCourses')
  final List<Course> topCourses;

  HomeModel({
    required this.user,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class User {
  final String name;
  final int notifications;

  User({
    required this.name,
    required this.notifications,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Course {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;
  final int? progress;
  final int? price;
  final String? currency;
  final int? enrolledStudents;

  Course({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
    this.progress,
    this.price,
    this.currency,
    this.enrolledStudents,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
