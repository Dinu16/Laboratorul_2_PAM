import 'package:flutter/material.dart';
import 'package:lab_2/list_items/category_item.dart';
import '../resources/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.item});

  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 33,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.colorffff,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.color707E,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          item.name,
          style: TextStyle(
            color: AppColors.color434C,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 11,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
