import 'package:lab_2/list_items/list_item.dart';

class ContinueWatchingCardItem extends ListItem {
  final String imagePath;
  final String title;
  final String publisher;
  final double? rating;
  final int? progress;

  ContinueWatchingCardItem(
      {required this.imagePath,
      required this.title,
      required this.rating,
      required this.progress,
      required this.publisher});
}
