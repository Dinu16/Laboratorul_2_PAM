// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsDto _$DetailsDtoFromJson(Map<String, dynamic> json) => DetailsDto(
      course: json['course'] == null
          ? null
          : CourseDetailsDataDto.fromJson(
              json['course'] as Map<String, dynamic>),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseDetailsDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsDtoToJson(DetailsDto instance) =>
    <String, dynamic>{
      'course': instance.course,
      'courses': instance.courses,
    };

CourseDetailsDataDto _$CourseDetailsDataDtoFromJson(
        Map<String, dynamic> json) =>
    CourseDetailsDataDto(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      institute: json['institute'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] as String? ?? '',
      price: (json['price'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      enrolledStudents: (json['enrolledStudents'] as num?)?.toInt(),
      lectures: (json['lectures'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      certification: json['certification'] as String?,
      thumbnail: json['thumbnail'] as String?,
      previewVideo: json['previewVideo'] as String?,
      description: json['description'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      courseDetails: json['courseDetails'] == null
          ? null
          : CourseDetailsDto.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
      instructor: json['instructor'] == null
          ? null
          : InstructorDto.fromJson(json['instructor'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedCourses: (json['relatedCourses'] as List<dynamic>?)
          ?.map((e) => CourseDetailsDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDetailsDataDtoToJson(
        CourseDetailsDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'institute': instance.institute,
      'price': instance.price,
      'currency': instance.currency,
      'enrolledStudents': instance.enrolledStudents,
      'rating': instance.rating,
      'lectures': instance.lectures,
      'duration': instance.duration,
      'certification': instance.certification,
      'thumbnail': instance.thumbnail,
      'previewVideo': instance.previewVideo,
      'description': instance.description,
      'skills': instance.skills,
      'courseDetails': instance.courseDetails,
      'instructor': instance.instructor,
      'lessons': instance.lessons,
      'relatedCourses': instance.relatedCourses,
      'image': instance.image,
    };

CourseDetailsDto _$CourseDetailsDtoFromJson(Map<String, dynamic> json) =>
    CourseDetailsDto(
      lectures: json['lectures'] as String? ?? '',
      learningTime: json['learningTime'] as String? ?? '',
      certification: json['certification'] as String? ?? '',
    );

Map<String, dynamic> _$CourseDetailsDtoToJson(CourseDetailsDto instance) =>
    <String, dynamic>{
      'lectures': instance.lectures,
      'learningTime': instance.learningTime,
      'certification': instance.certification,
    };

InstructorDto _$InstructorDtoFromJson(Map<String, dynamic> json) =>
    InstructorDto(
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$InstructorDtoToJson(InstructorDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'bio': instance.bio,
      'image': instance.image,
    };

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      isPreview: json['isPreview'] as bool? ?? false,
    );

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'isPreview': instance.isPreview,
    };
