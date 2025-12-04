import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';
import '../list_items/card_carousel_item.dart';
import '../list_items/course_details_list_item.dart';
import '../list_items/description_list_item.dart';
import '../list_items/enroll_list_item.dart';
import '../list_items/lesson_list_item.dart';
import '../list_items/section_details_list_item.dart';
import '../list_items/skills_list_item.dart';
import '../list_items/start_trial_list_item.dart';
import '../list_items/title_price_item.dart';
import '../list_items/video_details_list_item.dart';
import '../resources/app_colors.dart';
import '../widgets/card_carousel_widget.dart';
import '../widgets/course_details_list_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/enroll_widget.dart';
import '../widgets/lesson_list_widget.dart';
import '../widgets/section_details_widget.dart';
import '../widgets/skills_list_widget.dart';
import '../widgets/start_trial_widget.dart';
import '../widgets/video_details_widget.dart';

import '../controllers/display_page_controller.dart';
import '../list_items/spacer_item.dart';
import '../widgets/spacer_widget.dart';
import '../widgets/title_price_widget.dart';

class CourseDisplayPage extends StatefulWidget {
  const CourseDisplayPage({super.key});

  @override
  State<CourseDisplayPage> createState() => _CourseDisplayPageState();
}

class _CourseDisplayPageState extends State<CourseDisplayPage> {
  @override
  void initState() {
    super.initState();
    // Get course ID from route arguments and ensure it's a string
    final args = Get.arguments;
    final courseId = args != null ? args.toString().trim() : null;

    if (courseId == null || courseId.isEmpty) {
      print('Warning: Course ID is null or empty');
    }

    // Ensure HomePageController is available
    if (!Get.isRegistered<HomePageController>()) {
      Get.lazyPut(() => HomePageController(getFeedUseCase: Get.find()));
    }
    // Delete existing controller if any, then create a new one with courseId
    if (Get.isRegistered<DisplayPageController>()) {
      Get.delete<DisplayPageController>();
    }
    Get.put(DisplayPageController(
      getFeedDetailsByIdUseCase: Get.find(),
      courseId: courseId,
    ));
  }

  @override
  void dispose() {
    Get.delete<DisplayPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DisplayPageController controller = Get.find();
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: AppColors.colorffff,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.errorMessage.value.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.errorMessage.value),
                      ElevatedButton(
                        onPressed: () => controller.loadData(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.items[index];
                  if (item is SpacerItem) {
                    return SpacerWidget(item: item);
                  }
                  if (item is VideoDetailsListItem) {
                    return VideoDetailsWidget(item: item);
                  }
                  if (item is TitlePriceItem) {
                    return TitlePriceWidget(item: item);
                  }
                  if (item is SectionDetailsListItem) {
                    return SectionDetailsWidget(item: item);
                  }
                  if (item is DescriptionListItem) {
                    return DescriptionWidget(item: item);
                  }
                  if (item is CourseDetailsListItem) {
                    return CourseDetailsListWidget(item: item);
                  }
                  if (item is SkillsListItem) {
                    return SkillsListWidget(item: item);
                  }
                  if (item is LessonListItem) {
                    return LessonListWidget(item: item);
                  }
                  if (item is CardCarouselItem) {
                    return CardCarouselWidget(item: item);
                  }
                  if (item is EnrollListItem) {
                    return const EnrollWidget();
                  }
                  if (item is StartTrialListItem) {
                    return const StartTrialWidget();
                  }
                  return const SizedBox.shrink();
                },
              );
            }),
          ),
        ));
  }
}
