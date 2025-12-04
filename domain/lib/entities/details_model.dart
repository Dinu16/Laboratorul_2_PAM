class DetailsModel {
  final CourseDetailsData? course;
  final List<CourseDetailsData>? courses;

  DetailsModel({
    this.course,
    this.courses,
  });
}

class CourseDetailsData {
  final String id;
  final String title;
  final String institute;
  final int? price;
  final String? currency;
  final int? enrolledStudents;
  final double rating;
  final int? lectures;
  final String? duration;
  final String? certification;
  final String? thumbnail;
  final String? previewVideo;
  final String? description;
  final List<String>? skills;
  final CourseDetails? courseDetails;
  final Instructor? instructor;
  final List<Lesson>? lessons;
  final List<CourseDetailsData>? relatedCourses;
  final String image;

  CourseDetailsData({
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
}

class CourseDetails {
  final String lectures;
  final String learningTime;
  final String certification;

  CourseDetails({
    required this.lectures,
    required this.learningTime,
    required this.certification,
  });
}

class Instructor {
  final String name;
  final String title;
  final String bio;
  final String image;

  Instructor({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
  });
}

class Lesson {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });
}
