import 'list_item.dart';

class SearchBarListItem extends ListItem {
  final Function(String)? onSearchChanged;

  SearchBarListItem({required this.onSearchChanged});
}


