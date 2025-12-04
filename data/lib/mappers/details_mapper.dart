import 'package:data/models/dto/details_dto.dart';
import 'package:domain/entities/details_model.dart';

class DetailsMapper {
  static DetailsModel toDomain(DetailsDto dto) {
    return DetailsModel(
      course: dto.course != null
          ? CourseDetailsDataMapper.toDomain(dto.course!)
          : null,
      courses:
          dto.courses?.map((e) => CourseDetailsDataMapper.toDomain(e)).toList(),
    );
  }
}

class CourseDetailsDataMapper {
  static CourseDetailsData toDomain(CourseDetailsDataDto dto) {
    return CourseDetailsData(
      id: dto.id,
      title: dto.title,
      institute: dto.institute,
      rating: dto.rating,
      image: dto.image,
      price: dto.price,
      currency: dto.currency,
      enrolledStudents: dto.enrolledStudents,
      lectures: dto.lectures,
      duration: dto.duration,
      certification: dto.certification,
      thumbnail: dto.thumbnail,
      previewVideo: dto.previewVideo,
      description: dto.description,
      skills: dto.skills,
      courseDetails: dto.courseDetails != null
          ? CourseDetailsMapper.toDomain(dto.courseDetails!)
          : null,
      instructor: dto.instructor != null
          ? InstructorMapper.toDomain(dto.instructor!)
          : null,
      lessons: dto.lessons?.map((e) => LessonMapper.toDomain(e)).toList(),
      relatedCourses: dto.relatedCourses
          ?.map((e) => CourseDetailsDataMapper.toDomain(e))
          .toList(),
    );
  }
}

class CourseDetailsMapper {
  static CourseDetails toDomain(CourseDetailsDto dto) {
    return CourseDetails(
      lectures: dto.lectures,
      learningTime: dto.learningTime,
      certification: dto.certification,
    );
  }
}

class InstructorMapper {
  static Instructor toDomain(InstructorDto dto) {
    return Instructor(
      name: dto.name,
      title: dto.title,
      bio: dto.bio,
      image: dto.image,
    );
  }
}

class LessonMapper {
  static Lesson toDomain(LessonDto dto) {
    return Lesson(
      id: dto.id,
      title: dto.title,
      duration: dto.duration,
      isPreview: dto.isPreview,
    );
  }
}
