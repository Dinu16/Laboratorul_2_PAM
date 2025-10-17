import 'package:lab_2/list_items/list_item.dart';

class SearchBarListItem extends ListItem {
  final Function(String)? onSearchChanged;

  SearchBarListItem({required this.onSearchChanged});
}
