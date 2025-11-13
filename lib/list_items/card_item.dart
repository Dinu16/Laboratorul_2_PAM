import 'package:lab_2/list_items/list_item.dart';

class CardItem extends ListItem {
  final String id;
  final String imageUrl;
  final String title;
  final String publisher;
  final double? rating;
  final bool saved;

  CardItem(
      {required this.id,
      required this.imageUrl,
      required this.publisher,
      required this.rating,
      required this.title,
      required this.saved});
}
