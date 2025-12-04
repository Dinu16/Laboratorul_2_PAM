import 'package:json_annotation/json_annotation.dart';

part 'details_dto.g.dart';

@JsonSerializable()
class DetailsDto {
  final CourseDetailsDataDto? course;
  final List<CourseDetailsDataDto>? courses;

  DetailsDto({
    this.course,
    this.courses,
  });

  factory DetailsDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDtoToJson(this);
}

@JsonSerializable()
class CourseDetailsDataDto {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String institute;
  final int? price;
  final String? currency;
  final int? enrolledStudents;
  @JsonKey(defaultValue: 0.0)
  final double rating;
  final int? lectures;
  final String? duration;
  final String? certification;
  final String? thumbnail;
  final String? previewVideo;
  final String? description;
  final List<String>? skills;
  final CourseDetailsDto? courseDetails;
  final InstructorDto? instructor;
  final List<LessonDto>? lessons;
  final List<CourseDetailsDataDto>? relatedCourses;
  @JsonKey(defaultValue: '')
  final String image;

  CourseDetailsDataDto({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
    this.price,
    this.currency,
    this.enrolledStudents,
    this.lectures,
    this.duration,
    this.certification,
    this.thumbnail,
    this.previewVideo,
    this.description,
    this.skills,
    this.courseDetails,
    this.instructor,
    this.lessons,
    this.relatedCourses,
  });

  factory CourseDetailsDataDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsDataDtoToJson(this);
}

@JsonSerializable()
class CourseDetailsDto {
  @JsonKey(defaultValue: '')
  final String lectures;
  @JsonKey(defaultValue: '')
  final String learningTime;
  @JsonKey(defaultValue: '')
  final String certification;

  CourseDetailsDto({
    required this.lectures,
    required this.learningTime,
    required this.certification,
  });

  factory CourseDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsDtoToJson(this);
}

@JsonSerializable()
class InstructorDto {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String bio;
  @JsonKey(defaultValue: '')
  final String image;

  InstructorDto({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
  });

  factory InstructorDto.fromJson(Map<String, dynamic> json) =>
      _$InstructorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorDtoToJson(this);
}

@JsonSerializable()
class LessonDto {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String duration;
  @JsonKey(defaultValue: false)
  final bool isPreview;

  LessonDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);
}
