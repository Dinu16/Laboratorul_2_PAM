import 'package:get/get.dart';
import 'package:domain/entities/details_model.dart';
import 'package:domain/usecases/get_feed_details_by_id_usecase.dart';
import 'home_page_controller.dart';
import '../list_items/list_item.dart';
import '../list_items/spacer_item.dart';
import '../list_items/card_carousel_item.dart';
import '../list_items/card_item.dart';
import '../list_items/course_details_item.dart';
import '../list_items/course_details_list_item.dart';
import '../list_items/description_list_item.dart';
import '../list_items/enroll_list_item.dart';
import '../list_items/lesson_item.dart';
import '../list_items/lesson_list_item.dart';
import '../list_items/section_details_list_item.dart';
import '../list_items/skills_item.dart';
import '../list_items/skills_list_item.dart';
import '../list_items/start_trial_list_item.dart';
import '../list_items/title_price_item.dart';
import '../list_items/video_details_list_item.dart';

class DisplayPageController extends GetxController {
  final GetFeedDetailsByIdUseCase getFeedDetailsByIdUseCase;
  final String? courseId;

  DisplayPageController({
    required this.getFeedDetailsByIdUseCase,
    this.courseId,
  });

  RxList<ListItem> items = RxList();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isBookmarked = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get course ID from constructor or arguments
    final id = courseId ?? Get.arguments as String?;

    // Store the ID for later use
    final finalCourseId = id?.toString().trim();

    // Check if course is bookmarked from home controller
    if (finalCourseId != null &&
        finalCourseId.isNotEmpty &&
        Get.isRegistered<HomePageController>()) {
      try {
        final homeController = Get.find<HomePageController>();
        isBookmarked.value = homeController.isBookmarked(finalCourseId);
      } catch (e) {
        // HomePageController not found, use default value
        isBookmarked.value = false;
      }
    }
    loadData();
  }

  void toggleBookmark() {
    final id = courseId ?? Get.arguments as String?;
    final finalCourseId = id?.toString().trim();
    if (finalCourseId != null &&
        finalCourseId.isNotEmpty &&
        Get.isRegistered<HomePageController>()) {
      try {
        final homeController = Get.find<HomePageController>();
        homeController.toggleBookmark(finalCourseId);
        isBookmarked.value = homeController.isBookmarked(finalCourseId);
      } catch (e) {
        // HomePageController not found, toggle local state only
        isBookmarked.value = !isBookmarked.value;
      }
    } else {
      // Toggle local state if no home controller
      isBookmarked.value = !isBookmarked.value;
    }
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      items.clear(); // Clear previous items

      // Get course ID from constructor or arguments
      final id = courseId ?? Get.arguments as String?;

      if (id == null || id.toString().trim().isEmpty) {
        errorMessage.value = 'Course ID is required';
        isLoading.value = false;
        return;
      }

      // Convert to string and trim to ensure proper matching
      final courseIdString = id.toString().trim();

      // Debug: Print the course ID being used
      print('Loading details for course ID: $courseIdString');

      final DetailsModel detailsData =
      await getFeedDetailsByIdUseCase(courseIdString);
      addItems(detailsData);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to load data: $e';
      isLoading.value = false;
      print('Error loading details: $e');
    }
  }

  void addItems(DetailsModel detailsData) {
    final course = detailsData.course ??
        (detailsData.courses != null && detailsData.courses!.isNotEmpty
            ? detailsData.courses!.first
            : null);

    if (course == null) {
      errorMessage.value = 'Course data not available';
      return;
    }
    items.add(VideoDetailsListItem(
        thumbnail: course.thumbnail ?? course.image,
        previewVideo: course.previewVideo ?? '',
        saved: true));

    items.add(SpacerItem(height: 21));

    items.add(TitlePriceItem(
        title: course.title,
        publisher: course.institute,
        studentsEnrolled: course.enrolledStudents ?? 0,
        price: course.price ?? 0,
        currency: course.currency ?? "USD"));

    items.add(SpacerItem(height: 20));

    items.add(SectionDetailsListItem(title: 'Course Details'));

    items.add(SpacerItem(height: 10));

    items.add(DescriptionListItem(description: course.description ?? ''));

    items.add(SpacerItem(height: 28));

    final courseDetails = course.courseDetails;
    if (courseDetails != null) {
      items.add(CourseDetailsListItem(detailsList: [
        CourseDetailsItem(
            icon: 'lib/img/details/book-fill.png',
            title: "Lectures",
            details: courseDetails.lectures),
        CourseDetailsItem(
            icon: 'lib/img/details/time-fill.png',
            title: "Learning Time",
            details: courseDetails.learningTime),
        CourseDetailsItem(
            icon: 'lib/img/details/award-fill.png',
            title: "Certification",
            details: courseDetails.certification)
      ]));
    }

    items.add(SpacerItem(height: 24));

    items.add(SectionDetailsListItem(title: 'Skills'));

    items.add(SpacerItem(height: 10));

    if (course.skills != null && course.skills!.isNotEmpty) {
      items.add(SkillsListItem(
          skillsList: course.skills!
              .map((skill) => SkillsItem(title: skill))
              .toList()));
    }

    items.add(SpacerItem(height: 24));

    // Lessons Section
    if (course.lessons != null && course.lessons!.isNotEmpty) {
      items.add(SectionDetailsListItem(title: 'Lessons'));
      items.add(SpacerItem(height: 10));
      items.add(LessonListItem(
          lessons: course.lessons!
              .map((lesson) => LessonItem(
            id: lesson.id,
            title: lesson.title,
            duration: lesson.duration,
            isPreview: lesson.isPreview,
          ))
              .toList()));
      items.add(SpacerItem(height: 24));
    }

    // Related Courses Section
    if (course.relatedCourses != null && course.relatedCourses!.isNotEmpty) {
      items.add(SectionDetailsListItem(title: 'Related Courses'));
      items.add(SpacerItem(height: 11));
      items.add(CardCarouselItem(
          cardItems: course.relatedCourses!
              .map((relatedCourse) => CardItem(
            id: relatedCourse.id.toString(),
            imageUrl: relatedCourse.image,
            title: relatedCourse.title,
            publisher: relatedCourse.institute,
            rating: relatedCourse.rating,
            saved: false,
          ))
              .toList()));
      items.add(SpacerItem(height: 24));
    }

    items.add(SpacerItem(height: 11));

    items.add(EnrollListItem());

    items.add(SpacerItem(height: 20));

    items.add(StartTrialListItem());
  }
}
