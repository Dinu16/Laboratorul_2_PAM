import 'package:flutter/material.dart';
import '../list_items/categories_list_item.dart';
import 'category_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key, required this.item});

  final CategoriesListItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        itemCount: item.categoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index < item.categoryItems.length - 1 ? 8 : 0,
            ),
            child: CategoryWidget(item: item.categoryItems[index]),
          );
        },
      ),
    );
  }
}


