import 'package:flutter/material.dart';
import 'package:lab_2/list_items/lesson_list_item.dart';
import 'package:lab_2/widgets/lesson_widget.dart';

class LessonListWidget extends StatelessWidget {
  const LessonListWidget({super.key, required this.item});

  final LessonListItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < item.lessons.length; i++) ...[
          LessonWidget(item: item.lessons[i]),
          if (i != item.lessons.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }
}
