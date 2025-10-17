import 'package:flutter/material.dart';
import 'package:lab_2/list_items/course_details_list_item.dart';
import 'package:lab_2/widgets/course_details_widget.dart';

class CourseDetailsListWidget extends StatelessWidget {
  const CourseDetailsListWidget({
    super.key,
    required this.item,
  });

  final CourseDetailsListItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < item.detailsList.length; i++) ...[
          CourseDetailsWidget(item: item.detailsList[i]),
          if (i != item.detailsList.length - 1)
            const SizedBox(height: 13),
        ],
      ],
    );
  }
}
