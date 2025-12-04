import 'package:data/models/dto/home_dto.dart';
import 'package:domain/entities/home_model.dart';

class HomeMapper {
  static HomeModel toDomain(HomeDto dto) {
    return HomeModel(
      user: UserMapper.toDomain(dto.user),
      continueWatching:
          dto.continueWatching.map((e) => CourseMapper.toDomain(e)).toList(),
      categories:
          dto.categories.map((e) => CategoryMapper.toDomain(e)).toList(),
      suggestions:
          dto.suggestions.map((e) => CourseMapper.toDomain(e)).toList(),
      topCourses: dto.topCourses.map((e) => CourseMapper.toDomain(e)).toList(),
    );
  }
}

class UserMapper {
  static User toDomain(UserDto dto) {
    return User(
      name: dto.name,
      notifications: dto.notifications,
    );
  }
}

class CategoryMapper {
  static Category toDomain(CategoryDto dto) {
    return Category(
      id: dto.id,
      name: dto.name,
    );
  }
}

class CourseMapper {
  static Course toDomain(CourseDto dto) {
    return Course(
      id: dto.id,
      title: dto.title,
      institute: dto.institute,
      rating: dto.rating,
      image: dto.image,
      progress: dto.progress,
      price: dto.price,
      currency: dto.currency,
      enrolledStudents: dto.enrolledStudents,
    );
  }
}
