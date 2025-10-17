import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/list_items/card_item.dart';
import 'package:lab_2/resources/app_colors.dart';

import '../pages/course_display_page.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.item});
  final CardItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/course-display-page');
      },
      child: Container(
        width: 130,
        height: 158,
        margin: const EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: AppColors.colorffff,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.color0000.withOpacity(0.05),
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Stack(
                children: [
                  Image.asset(
                    item.imagePath,
                    height: 85,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        item.saved ? Icons.bookmark : Icons.bookmark_border,
                        color: AppColors.color707E,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.color434C,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.2,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.publisher,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.color6C6C,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 9,
                      height: 1.2,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 11, color: AppColors.color707E),
                      const SizedBox(width: 3),
                      Text(
                        (item.rating ?? 0).toStringAsFixed(1),
                        style: TextStyle(
                          color: AppColors.color434C,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 9.5,
                          height: 1.0,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
