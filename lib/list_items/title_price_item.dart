import 'package:lab_2/list_items/list_item.dart';

class TitlePriceItem extends ListItem {
  final String title;
  final String publisher;
  final int? studentsEnrolled;
  final int price;
  final String currency;

  TitlePriceItem(
      {required this.title,
      required this.publisher,
      required this.price,
      required this.studentsEnrolled,
      required this.currency});
}
