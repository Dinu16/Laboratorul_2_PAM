import 'package:flutter/material.dart';
import 'package:lab_2/list_items/skills_list_item.dart';
import 'package:lab_2/widgets/skills_widget.dart';

class SkillsListWidget extends StatelessWidget {
  const SkillsListWidget({
    super.key,
    required this.item,
  });

  final SkillsListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Wrap(
        spacing: 10,
        runSpacing: 13,
        children: [
          for (final skill in item.skillsList)
            SkillsWidget(item: skill),
        ],
      ),
    );
  }
}
