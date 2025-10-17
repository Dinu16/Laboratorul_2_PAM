import 'package:flutter/material.dart';
import 'package:lab_2/list_items/categories_list_item.dart';
import 'package:lab_2/widgets/category_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key, required this.item});

  final CategoriesListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: item.categoryItems
            .map((category) => CategoryWidget(item: category))
            .toList(),
      ),
    );
  }
}
