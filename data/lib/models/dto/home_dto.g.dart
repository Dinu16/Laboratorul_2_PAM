// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => HomeDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      continueWatching: (json['continueWatching'] as List<dynamic>)
          .map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      topCourses: (json['topCourses'] as List<dynamic>)
          .map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDtoToJson(HomeDto instance) => <String, dynamic>{
      'user': instance.user,
      'continueWatching': instance.continueWatching,
      'categories': instance.categories,
      'suggestions': instance.suggestions,
      'topCourses': instance.topCourses,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      name: json['name'] as String,
      notifications: (json['notifications'] as num).toInt(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'name': instance.name,
      'notifications': instance.notifications,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      progress: (json['progress'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      enrolledStudents: (json['enrolledStudents'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'institute': instance.institute,
      'rating': instance.rating,
      'image': instance.image,
      'progress': instance.progress,
      'price': instance.price,
      'currency': instance.currency,
      'enrolledStudents': instance.enrolledStudents,
    };
