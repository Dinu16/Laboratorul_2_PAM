import 'package:lab_2/list_items/list_item.dart';
import 'card_item.dart';

class CardCarouselItem extends ListItem{
  final List<CardItem> cardItems;

  CardCarouselItem({
    required this.cardItems
});
}