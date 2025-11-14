import 'package:get/get.dart';
import 'package:lab_2/list_items/list_item.dart';
import 'package:lab_2/list_items/spacer_item.dart';
import 'package:lab_2/list_items/welcome_header_item.dart';
import 'package:lab_2/list_items/search_bar_list_item.dart';
import 'package:lab_2/list_items/section_item.dart';
import 'package:lab_2/list_items/continue_watching_list_item.dart';
import 'package:lab_2/list_items/continue_watching_card_item.dart';
import 'package:lab_2/list_items/categories_list_item.dart';
import 'package:lab_2/list_items/category_item.dart';
import 'package:lab_2/list_items/card_carousel_item.dart';
import 'package:lab_2/list_items/card_item.dart';
import 'package:lab_2/services/data_service.dart';

import '../model/home_model.dart';

class HomePageController extends GetxController {
  RxList<ListItem> items = RxList();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxSet<String> bookmarkedCourses = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void toggleBookmark(String courseId) {
    if (bookmarkedCourses.contains(courseId)) {
      bookmarkedCourses.remove(courseId);
    } else {
      bookmarkedCourses.add(courseId);
    }
  }

  bool isBookmarked(String courseId) {
    return bookmarkedCourses.contains(courseId);
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final HomeModel homeData = await DataService.loadHomeData();
      addItems(homeData);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to load data: $e';
      isLoading.value = false;
    }
  }

  void addItems(HomeModel homeData) {
    items.add(SpacerItem(height: 6));

    items.add(WelcomeHeaderItem(
        userName: " ${homeData.user.name}",
        nrOfNotifications: homeData.user.notifications));

    items.add(SpacerItem(height: 22));

    items.add(SearchBarListItem(
      onSearchChanged: (value) {},
    ));

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Continue Watching", rightTitle: ""));

    items.add(SpacerItem(height: 11));

    items.add(
      ContinueWatchingListItem(
        continueWatchingList: homeData.continueWatching
            .map((course) => ContinueWatchingCardItem(
          id: course.id,
          imageUrl: course.image,
          title: course.title,
          publisher: course.institute,
          rating: course.rating,
          progress: course.progress,
        ))
            .toList(),
      ),
    );

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Categories", rightTitle: "See All"));

    items.add(SpacerItem(height: 11));

    items.add(
      CategoriesListItem(
        categoryItems: homeData.categories
            .map((category) => CategoryItem(
          id: category.id,
          name: category.name,
        ))
            .toList(),
      ),
    );

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Suggestions for You", rightTitle: "See All"));

    items.add(SpacerItem(height: 12));

    items.add(
      CardCarouselItem(
        cardItems: homeData.suggestions
            .map((course) => CardItem(
          id: course.id,
          imageUrl: course.image,
          title: course.title,
          publisher: course.institute,
          rating: course.rating,
          saved: true,
        ))
            .toList(),
      ),
    );

    items.add(SpacerItem(height: 16));

    items.add(SectionItem(title: "Top Courses", rightTitle: "See All"));

    items.add(SpacerItem(height: 11));

    items.add(
      CardCarouselItem(
        cardItems: homeData.topCourses
            .map((course) => CardItem(
          id: course.id,
          imageUrl: course.image,
          title: course.title,
          publisher: course.institute,
          rating: course.rating,
          saved: false,
        ))
            .toList(),
      ),
    );

    items.add(SpacerItem(height: 11));
  }
}
