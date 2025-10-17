import 'package:flutter/material.dart';
import 'package:lab_2/list_items/section_item.dart';

import '../resources/app_colors.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.item});

  final SectionItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${item.title}",
            style: TextStyle(
                color: AppColors.color434C,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 1.0,
                letterSpacing: 1.0),
            textAlign: TextAlign.left,
          ),
          if (item.rightTitle != null && item.rightTitle!.isNotEmpty)
            Text(
              "${item.rightTitle}",
              style: TextStyle(
                  color: AppColors.color6C6C,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 1.0,
                  letterSpacing: 0.5,
                  decoration: TextDecoration.underline),
            )
        ],
      ),
    );
  }
}
