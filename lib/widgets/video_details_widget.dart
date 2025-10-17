import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/list_items/video_details_list_item.dart';
import 'package:lab_2/resources/app_colors.dart';

class VideoDetailsWidget extends StatelessWidget {
  const VideoDetailsWidget({super.key, required this.item});

  final VideoDetailsListItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          item.imagePath,
          height: 177,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Container(
          height: 177,
          width: double.infinity,
          color: AppColors.color8697.withOpacity(0.4),
        ),

        Container(
          width: 41,
          height: 41,
          decoration: BoxDecoration(
            color: AppColors.colorEFF2.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.play_arrow,
            size: 21,
            color: AppColors.color707E,
          ),
        ),

        Positioned(
          top: 10,
          left: 21,
          right: 21,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: AppColors.colorEFF2,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Icon(
                  item.saved ? Icons.bookmark : Icons.bookmark_border,
                  color: AppColors.color707E,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
