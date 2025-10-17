import 'package:flutter/material.dart';
import 'package:lab_2/list_items/card_carousel_item.dart';
import 'package:lab_2/widgets/card_widget.dart';

class CardCarouselWidget extends StatelessWidget {
  const CardCarouselWidget({
    super.key,
    required this.item,
  });

  final CardCarouselItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: item.cardItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final card = item.cardItems[index];
          final double leftPadding = index == 0 ? 21 : 0;
          final double rightPadding =
          index == item.cardItems.length - 1 ? 21 : 0;

          return Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: CardWidget(item: card),
          );
        },
      ),
    );
  }
}
