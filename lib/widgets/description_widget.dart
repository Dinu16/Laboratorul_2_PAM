import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lab_2/list_items/description_list_item.dart';
import 'package:lab_2/resources/app_colors.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({
    super.key,
    required this.item,
    this.maxLines = 6,
  });

  final DescriptionListItem item;
  final int maxLines;

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final exceeds = _exceedsMaxLines(
            text: widget.item.description,
            style: TextStyle(
              color: AppColors.color6C6C,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 11,
              height: 1.15,
              letterSpacing: 1.5,
            ),
            maxWidth: constraints.maxWidth,
            maxLines: widget.maxLines,
            textDirection: Directionality.of(context),
          );

          final effectiveText = exceeds && !_expanded
              ? _trimToMaxLines(widget.item.description,
              constraints.maxWidth, widget.maxLines, context)
              : widget.item.description;

          return RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: effectiveText,
                  style: TextStyle(
                    color: AppColors.color6C6C,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    height: 1.15,
                    letterSpacing: 1.5,
                  ),
                ),
                if (exceeds)
                  TextSpan(
                    text: _expanded ? ' Read Less' : ' Read More…',
                    style: TextStyle(
                      color: AppColors.color6C6C,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      height: 1.15,
                      letterSpacing: 1.5,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => setState(() => _expanded = !_expanded),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _exceedsMaxLines({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required int maxLines,
    required TextDirection textDirection,
  }) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: textDirection,
      ellipsis: '…',
    );
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp.didExceedMaxLines;
  }

  String _trimToMaxLines(
      String text, double maxWidth, int maxLines, BuildContext context) {
    var endIndex = text.length;
    while (endIndex > 0) {
      endIndex -= 5;
      final testText = text.substring(0, endIndex);
      final tp = TextPainter(
        text: TextSpan(
          text: testText,
          style: TextStyle(
            color: AppColors.color6C6C,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w400,
            fontSize: 11,
            height: 1.15,
            letterSpacing: 1.5,
          ),
        ),
        maxLines: maxLines,
        textDirection: Directionality.of(context),
      );
      tp.layout(maxWidth: maxWidth);
      if (!tp.didExceedMaxLines) return testText;
    }
    return text;
  }
}
