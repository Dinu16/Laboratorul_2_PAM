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

class HomePageController extends GetxController {
  RxList<ListItem> items = RxList();

  @override
  void onInit() {
    super.onInit();
    addItems();
  }

  void addItems() {
    items.add(SpacerItem(height: 6));

    items.add(WelcomeHeaderItem(userName: " Sidra", nrOfNotifications: 5));

    items.add(SpacerItem(height: 22));

    items.add(SearchBarListItem(
      onSearchChanged: (value) {},
    ));

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Continue Watching", rightTitle: ""));

    items.add(SpacerItem(height: 11));

    items.add(
      ContinueWatchingListItem(continueWatchingList: [
        ContinueWatchingCardItem(
          id: "1",
          imagePath: "lib/img/continue_watching/course1.jpg",
          title: "UI/UX Design Essentials",
          publisher: "Tech Innovations University",
          rating: 4.9,
          progress: 79,
        ),
        ContinueWatchingCardItem(
          id: "2",
          imagePath: "lib/img/continue_watching/course2.jpg",
          title: "Graphic Design Fundamentals",
          publisher: "Creative Arts Institute",
          rating: 4.7,
          progress: 35,
        ),
      ]),
    );

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Categories", rightTitle: "See All"));

    items.add(SpacerItem(height: 11));

    items.add(
      CategoriesListItem(categoryItems: [
        CategoryItem(id: "3", name: "Graphic Design"),
        CategoryItem(id: "4",name: "User Interface"),
        CategoryItem(id: "5",name: "User Experience"),
      ]),
    );

    items.add(SpacerItem(height: 17));

    items.add(SectionItem(title: "Suggestions for You", rightTitle: "See All"));

    items.add(SpacerItem(height: 12));

    items.add(
      CardCarouselItem(cardItems: [
        CardItem(
          id: "6",
          imageUrl: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60",
          title: "Typography and Layout Design",
          publisher: "Visual Communication College",
          rating: 4.7,
          saved: false,
        ),
        CardItem(
          id: "7",
          imageUrl: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60",
          title: "Branding and Identity Design",
          publisher: "Innovation and Design School",
          rating: 4.4,
          saved: true,
        ),
        CardItem(
          id: "8",
          imageUrl: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60",
          title: "Web Design Fundamentals",
          publisher: "Web Development University",
          rating: 4.9,
          saved: false,
        ),
      ]),
    );

    items.add(SpacerItem(height: 16));

    items.add(SectionItem(title: "Top Courses", rightTitle: "See All"));

    items.add(SpacerItem(height: 11));

    items.add(
      CardCarouselItem(cardItems: [
        CardItem(
          id: "9",
          imageUrl: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60",
          title: "Animation and Motion Graphics",
          publisher: "National Institute of Digital Arts",
          rating: 4.8,
          saved: true,
        ),
        CardItem(
          id: "10",
          imageUrl: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60",
          title: "Game Design and Development",
          publisher: "Game Dev Academy",
          rating: 4.6,
          saved: true,
        ),
        CardItem(
          id: "11",
          imageUrl: "https://images.unsplash.com/photo-1605379399642-870262d3d051?auto=format&fit=crop&w=800&q=60",
          title: "Product Design and Innovation",
          publisher: "UX Development Lab",
          rating: 4.5,
          saved: false,
        ),
      ]),
    );

    items.add(SpacerItem(height: 11));
  }
}
