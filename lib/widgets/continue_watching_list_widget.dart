import 'package:flutter/material.dart';

import '../list_items/continue_watching_list_item.dart';
import 'continue_watching_card_widget.dart';

class ContinueWatchingListSlotted extends StatelessWidget {
  const ContinueWatchingListSlotted({super.key, required this.item});

  final ContinueWatchingListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 29),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: item.continueWatchingList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final cardItem = item.continueWatchingList[index];
          return ContinueWatchingCardWidget(item: cardItem);
        },
      ),
    );
  }
}
