class HomeModel {
  final User user;
  final List<Course> continueWatching;
  final List<Category> categories;
  final List<Course> suggestions;
  final List<Course> topCourses;

  HomeModel({
    required this.user,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });
}

class User {
  final String name;
  final int notifications;

  User({
    required this.name,
    required this.notifications,
  });
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}

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
}
