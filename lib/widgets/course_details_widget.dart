import 'package:flutter/material.dart';
import 'package:lab_2/list_items/course_details_item.dart';
import 'package:lab_2/resources/app_colors.dart';

class CourseDetailsWidget extends StatelessWidget {
  const CourseDetailsWidget({
    super.key,
    required this.item,
  });

  final CourseDetailsItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  child: Image.asset(
                    item.icon,
                    width: 15,
                    height: 15,
                    color: AppColors.color707E,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 11),
                Flexible(
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.color707E,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(
            item.details,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.color6C6C,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 1.0,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
