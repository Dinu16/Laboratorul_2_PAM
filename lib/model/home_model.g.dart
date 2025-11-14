// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      continueWatching: (json['continueWatching'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      topCourses: (json['topCourses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'user': instance.user,
      'continueWatching': instance.continueWatching,
      'categories': instance.categories,
      'suggestions': instance.suggestions,
      'topCourses': instance.topCourses,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      notifications: (json['notifications'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'notifications': instance.notifications,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
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

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
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
