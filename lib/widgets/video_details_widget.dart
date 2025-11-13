import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/list_items/video_details_list_item.dart';
import 'package:lab_2/resources/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsWidget extends StatefulWidget {
  const VideoDetailsWidget({super.key, required this.item});

  final VideoDetailsListItem item;

  @override
  State<VideoDetailsWidget> createState() => _VideoDetailsWidgetState();
}

class _VideoDetailsWidgetState extends State<VideoDetailsWidget> {
  late VideoPlayerController _controller;
  bool _isPlayingPreview = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.item.previewVideo),
    )..initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!_isPlayingPreview)
          Image.network(
            widget.item.thumbnail,
            height: 177,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 177,
                width: double.infinity,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
              );
            },
          ),

        if (_isPlayingPreview && _controller.value.isInitialized)
          SizedBox(
            height: 177,
            width: double.infinity,
            child: VideoPlayer(_controller),
          ),

        if (!_isPlayingPreview)
          Container(
            height: 177,
            width: double.infinity,
            color: AppColors.color8697.withOpacity(0.4),
          ),

        if (!_isPlayingPreview)
          InkWell(
            onTap: () {
              setState(() {
                _isPlayingPreview = true;
              });
              _controller.play();
            },
            child: Container(
              width: 41,
              height: 41,
              decoration: BoxDecoration(
                color: AppColors.colorEFF2.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 21,
                color: AppColors.color707E,
              ),
            ),
          ),

        Positioned(
          top: 10,
          left: 21,
          right: 21,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: AppColors.colorEFF2,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Icon(
                  widget.item.saved ? Icons.bookmark : Icons.bookmark_border,
                  color: AppColors.color707E,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
