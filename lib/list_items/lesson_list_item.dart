import 'list_item.dart';
import 'lesson_item.dart';

class LessonListItem extends ListItem {
  final List<LessonItem> lessons;

  LessonListItem({required this.lessons});
}
