import 'package:flutter/material.dart';
import 'package:lab_2/list_items/section_details_list_item.dart';

import '../resources/app_colors.dart';

class SectionDetailsWidget extends StatelessWidget {
  const SectionDetailsWidget({super.key, required this.item});

  final SectionDetailsListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
      child:
          Text(
            "${item.title}",
            style: TextStyle(
                color: AppColors.color707E,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 1.0,
                letterSpacing: 1.0),
            textAlign: TextAlign.left,
          )
      );
  }
}
