import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/list_items/continue_watching_card_item.dart';

import '../resources/app_colors.dart';

class ContinueWatchingCardWidget extends StatelessWidget {
  const ContinueWatchingCardWidget({super.key, required this.item});
  final ContinueWatchingCardItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/course-display-page');
      },
      child: Container(
        height: 77,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.color0000.withOpacity(0.05),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.all(11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                item.imageUrl,
                width: 87,
                height: 58,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 87,
                    height: 58,
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child:
                        Icon(Icons.broken_image, size: 18, color: Colors.grey),
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    width: 87,
                    height: 58,
                    color: Colors.grey.shade100,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: AppColors.color434C,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.publisher,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                      color: AppColors.color707E,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 9, color: AppColors.color707E),
                      const SizedBox(width: 2),
                      Text(
                        (item.rating ?? 0).toStringAsFixed(1),
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 6,
                          fontWeight: FontWeight.w500,
                          color: AppColors.color707E,
                          letterSpacing: 0.5,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: (item.progress ?? 0) / 100,
                      minHeight: 4, // was 6
                      backgroundColor: AppColors.colorD9D9,
                      color: AppColors.color707E,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${item.progress ?? 0}% Completed',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 6,
                        fontWeight: FontWeight.w500,
                        color: AppColors.color6C6C,
                      ),
                    ),
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
