import 'package:get/get.dart';
import 'package:lab_2/controllers/home_page_controller.dart';
import 'package:lab_2/list_items/card_carousel_item.dart';
import 'package:lab_2/list_items/card_item.dart';
import 'package:lab_2/list_items/course_details_item.dart';
import 'package:lab_2/list_items/course_details_list_item.dart';
import 'package:lab_2/list_items/description_list_item.dart';
import 'package:lab_2/list_items/enroll_list_item.dart';
import 'package:lab_2/list_items/lesson_item.dart';
import 'package:lab_2/list_items/lesson_list_item.dart';
import 'package:lab_2/list_items/section_details_list_item.dart';
import 'package:lab_2/list_items/skills_item.dart';
import 'package:lab_2/list_items/skills_list_item.dart';
import 'package:lab_2/list_items/start_trial_list_item.dart';
import 'package:lab_2/list_items/title_price_item.dart';
import 'package:lab_2/list_items/video_details_list_item.dart';

import '../list_items/list_item.dart';
import '../list_items/spacer_item.dart';
import '../services/data_service.dart';
import '../model/details_model.dart';

class DisplayPageController extends GetxController {
  RxList<ListItem> items = RxList();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  String? courseId;
  final RxBool isBookmarked = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get course ID from arguments
    courseId = Get.arguments as String?;
    // Check if course is bookmarked from home controller
    if (courseId != null && Get.isRegistered<HomePageController>()) {
      try {
        final homeController = Get.find<HomePageController>();
        isBookmarked.value = homeController.isBookmarked(courseId!);
      } catch (e) {
        // HomePageController not found, use default value
        isBookmarked.value = false;
      }
    }
    loadData();
  }

  void toggleBookmark() {
    if (courseId != null && Get.isRegistered<HomePageController>()) {
      try {
        final homeController = Get.find<HomePageController>();
        homeController.toggleBookmark(courseId!);
        isBookmarked.value = homeController.isBookmarked(courseId!);
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
      final DetailsModel detailsData = courseId != null
          ? await DataService.loadDetailsDataById(courseId!)
          : await DataService.loadDetailsData();
      addItems(detailsData);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to load data: $e';
      isLoading.value = false;
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

    if (course.relatedCourses != null && course.relatedCourses!.isNotEmpty) {
      items.add(SectionDetailsListItem(title: 'Related Courses'));
      items.add(SpacerItem(height: 11));
      items.add(CardCarouselItem(
          cardItems: course.relatedCourses!
              .map((relatedCourse) => CardItem(
                    id: relatedCourse.id,
                    imageUrl: relatedCourse.image,
                    title: relatedCourse.title,
                    publisher: relatedCourse.institute,
                    rating: relatedCourse.rating,
                    saved: false,
                  ))
              .toList()));
    }

    items.add(SpacerItem(height: 11));

    items.add(EnrollListItem());

    items.add(StartTrialListItem());
  }
}
