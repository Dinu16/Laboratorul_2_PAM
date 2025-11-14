import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/controllers/home_page_controller.dart';
import 'package:lab_2/list_items/welcome_header_item.dart';
import 'package:lab_2/resources/app_colors.dart';
import 'package:lab_2/widgets/welcome_header_widget.dart';

import '../list_items/card_carousel_item.dart';
import '../list_items/categories_list_item.dart';
import '../list_items/continue_watching_list_item.dart';
import '../list_items/search_bar_list_item.dart';
import '../list_items/section_item.dart';
import '../list_items/spacer_item.dart';
import '../widgets/card_carousel_widget.dart';
import '../widgets/categories_list_widget.dart';
import '../widgets/continue_watching_list_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/section_widget.dart';
import '../widgets/spacer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => HomePageController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
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
                if (item is WelcomeHeaderItem) {
                  return WelcomeHeaderWidget(item: item);
                }
                if (item is SearchBarListItem) {
                  return SearchBarWidget(item: item);
                }
                if (item is SectionItem) {
                  return SectionWidget(item: item);
                }
                if (item is ContinueWatchingListItem) {
                  return ContinueWatchingListSlotted(item: item);
                }
                if (item is CategoriesListItem) {
                  return CategoriesListWidget(item: item);
                }
                if (item is CardCarouselItem) {
                  return CardCarouselWidget(item: item);
                }
                return const SizedBox.shrink();
              },
            );
          }),
        ),
      ),
    );
  }
}
