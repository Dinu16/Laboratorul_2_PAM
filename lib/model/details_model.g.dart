// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
      course: json['course'] == null
          ? null
          : CourseDetailsData.fromJson(json['course'] as Map<String, dynamic>),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'courses': instance.courses,
    };

CourseDetailsData _$CourseDetailsDataFromJson(Map<String, dynamic> json) =>
    CourseDetailsData(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
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
          : CourseDetails.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
      instructor: json['instructor'] == null
          ? null
          : Instructor.fromJson(json['instructor'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedCourses: (json['relatedCourses'] as List<dynamic>?)
          ?.map((e) => CourseDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDetailsDataToJson(CourseDetailsData instance) =>
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

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      lectures: json['lectures'] as String,
      learningTime: json['learningTime'] as String,
      certification: json['certification'] as String,
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      'lectures': instance.lectures,
      'learningTime': instance.learningTime,
      'certification': instance.certification,
    };

Instructor _$InstructorFromJson(Map<String, dynamic> json) => Instructor(
      name: json['name'] as String,
      title: json['title'] as String,
      bio: json['bio'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$InstructorToJson(Instructor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'bio': instance.bio,
      'image': instance.image,
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      isPreview: json['isPreview'] as bool,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'isPreview': instance.isPreview,
    };
