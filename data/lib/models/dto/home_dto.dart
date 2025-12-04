import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDto {
  final UserDto user;
  @JsonKey(name: 'continueWatching')
  final List<CourseDto> continueWatching;
  final List<CategoryDto> categories;
  final List<CourseDto> suggestions;
  @JsonKey(name: 'topCourses')
  final List<CourseDto> topCourses;

  HomeDto({
    required this.user,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDtoToJson(this);
}

@JsonSerializable()
class UserDto {
  final String name;
  final int notifications;

  UserDto({
    required this.name,
    required this.notifications,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class CategoryDto {
  final String id;
  final String name;

  CategoryDto({
    required this.id,
    required this.name,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

@JsonSerializable()
class CourseDto {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;
  final int? progress;
  final int? price;
  final String? currency;
  final int? enrolledStudents;

  CourseDto({
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

  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}
