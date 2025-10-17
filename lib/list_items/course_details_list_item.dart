import 'package:lab_2/list_items/list_item.dart';

import 'course_details_item.dart';

class CourseDetailsListItem extends ListItem {
  final List<CourseDetailsItem> detailsList;

  CourseDetailsListItem({required this.detailsList});
}
