import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:data/models/dto/home_dto.dart';
import 'package:data/models/dto/details_dto.dart';

class FeedRemoteDataSource {
  static const String baseUrl = 'https://test-api-jlbn.onrender.com/v1';

  Future<HomeDto> getFeed() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/feed'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return HomeDto.fromJson(jsonData);
      } else {
        throw Exception('Failed to load feed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load feed: $e');
    }
  }

  Future<DetailsDto> getFeedDetails() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/feed/details'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return DetailsDto.fromJson(jsonData);
      } else {
        throw Exception('Failed to load feed details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load feed details: $e');
    }
  }

  Future<DetailsDto> getFeedDetailsById(String courseId) async {
    try {
      // Normalize the course ID (trim whitespace, convert to string)
      final normalizedCourseId = courseId.toString().trim();

      // Debug: Print the course ID being searched
      print('Searching for course ID: "$normalizedCourseId"');

      // Load home data to get basic course info (same as JSON implementation)
      final HomeDto homeData = await getFeed();

      // Try to find the course in home data - compare IDs as strings
      CourseDto? course;
      for (var c in homeData.continueWatching) {
        if (c.id.toString().trim() == normalizedCourseId) {
          course = c;
          break;
        }
      }
      if (course == null) {
        for (var c in homeData.suggestions) {
          if (c.id.toString().trim() == normalizedCourseId) {
            course = c;
            break;
          }
        }
      }
      if (course == null) {
        for (var c in homeData.topCourses) {
          if (c.id.toString().trim() == normalizedCourseId) {
            course = c;
            break;
          }
        }
      }

      // Load details data to check if we have full details for this course
      final DetailsDto detailsData = await getFeedDetails();

      // Check if we have courses array and find matching course
      if (detailsData.courses != null) {
        for (var courseDetail in detailsData.courses!) {
          if (courseDetail.id.toString().trim() == normalizedCourseId) {
            return DetailsDto(course: courseDetail);
          }
        }
      }

      // Check if we have single course and it matches
      if (detailsData.course != null &&
          detailsData.course!.id.toString().trim() == normalizedCourseId) {
        return detailsData;
      }

      // Otherwise, create a details DTO from the basic course data
      if (course != null) {
        final courseDetailsData = CourseDetailsDataDto(
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
        return DetailsDto(course: courseDetailsData);
      }

      // If course not found, throw error with more details
      throw Exception(
          'Course with id "$normalizedCourseId" not found. Searched in continueWatching, suggestions, topCourses, and details.');
    } catch (e) {
      throw Exception('Failed to load details data for id "$courseId": $e');
    }
  }
}
