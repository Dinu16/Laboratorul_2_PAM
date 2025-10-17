import 'package:lab_2/list_items/list_item.dart';

class CourseDetailsItem extends ListItem {
  final String icon;
  final String title;
  final String details;

  CourseDetailsItem(
      {required this.icon, required this.title, required this.details});
}
