import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/details_model.dart';
import '../model/home_model.dart';

class DataService {
  static Future<HomeModel> loadHomeData() async {
    try {
      final String jsonString =
      await rootBundle.loadString('lib/assets/data/home.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return HomeModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load home data: $e');
    }
  }

  static Future<DetailsModel> loadDetailsData() async {
    try {
      final String jsonString =
      await rootBundle.loadString('lib/assets/data/details.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return DetailsModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load details data: $e');
    }
  }

  static Future<DetailsModel> loadDetailsDataById(String courseId) async {
    try {
      final HomeModel homeData = await loadHomeData();

      Course? course;
      for (var c in homeData.continueWatching) {
        if (c.id == courseId) {
          course = c;
          break;
        }
      }
      if (course == null) {
        for (var c in homeData.suggestions) {
          if (c.id == courseId) {
            course = c;
            break;
          }
        }
      }
      if (course == null) {
        for (var c in homeData.topCourses) {
          if (c.id == courseId) {
            course = c;
            break;
          }
        }
      }

      final DetailsModel detailsData = await loadDetailsData();

      if (detailsData.courses != null) {
        for (var courseDetail in detailsData.courses!) {
          if (courseDetail.id == courseId) {
            return DetailsModel(course: courseDetail);
          }
        }
      }

      if (detailsData.course != null && detailsData.course!.id == courseId) {
        return detailsData;
      }

      if (course != null) {
        final courseDetailsData = CourseDetailsData(
          id: course.id,
          title: course.title,
          institute: course.institute,
          rating: course.rating,
          image: course.image,
          price: course.price,
          currency: course.currency,
          enrolledStudents: course.enrolledStudents,
          thumbnail: course.image,
          previewVideo: null,
          description: null,
          skills: null,
          courseDetails: null,
          instructor: null,
          lessons: null,
          relatedCourses: null,
        );
        return DetailsModel(course: courseDetailsData);
      }

      throw Exception('Course with id $courseId not found');
    } catch (e) {
      throw Exception('Failed to load details data: $e');
    }
  }
}
