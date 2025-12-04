import 'list_item.dart';

class VideoDetailsListItem extends ListItem {
  final String thumbnail;
  final String previewVideo;
  final bool saved;

  VideoDetailsListItem({required this.thumbnail,
    required this.previewVideo,
    required this.saved});
}


