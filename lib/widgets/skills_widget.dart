import 'package:flutter/material.dart';
import 'package:lab_2/list_items/skills_item.dart';
import '../resources/app_colors.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key, required this.item});

  final SkillsItem item;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 29,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.colorffff,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.colorDEDE,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(
              color: AppColors.color434C,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
