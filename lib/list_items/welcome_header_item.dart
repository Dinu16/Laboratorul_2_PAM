import 'list_item.dart';

class WelcomeHeaderItem extends ListItem {
  final String userName;
  final int? nrOfNotifications;

  WelcomeHeaderItem({required this.userName, required this.nrOfNotifications});
}
