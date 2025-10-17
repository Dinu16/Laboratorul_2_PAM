import 'package:lab_2/list_items/list_item.dart';

class VideoDetailsListItem extends ListItem {
  final String imagePath;
  final bool saved;

  VideoDetailsListItem({required this.imagePath, required this.saved});
}
