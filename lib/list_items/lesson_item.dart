import 'list_item.dart';

class LessonItem extends ListItem {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  LessonItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });
}
