import 'package:flutter/material.dart';
import 'package:lab_2/list_items/title_price_item.dart';
import 'package:lab_2/resources/app_colors.dart';

class TitlePriceWidget extends StatelessWidget {
  const TitlePriceWidget({
    super.key,
    required this.item,
  });

  final TitlePriceItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: AppColors.color434C,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 1.0
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.publisher,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.color707E,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Plus Jakarta Sans',
                        height: 1.0,
                        letterSpacing: 0.5
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (item.studentsEnrolled != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.people_alt,
                              size: 12, color: AppColors.color707E),
                          const SizedBox(width: 3),
                          Text(
                            '${_compact(item.studentsEnrolled!)} students already enrolled',
                            style: TextStyle(
                              color: AppColors.color707E,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Plus Jakarta Sans',
                              height: 1.0,
                              letterSpacing: 0.5
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            '${item.price}\$',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.color434C,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              fontFamily: 'Plus Jakarta Sans',
              height: 1.0,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  String _compact(int n) {
    if (n >= 1000000) {
      final v = n / 1000000;
      return v % 1 == 0 ? '${v.toStringAsFixed(0)}M' : '${v.toStringAsFixed(1)}M';
    } else if (n >= 1000) {
      final v = n / 1000;
      return v % 1 == 0 ? '${v.toStringAsFixed(0)}k' : '${v.toStringAsFixed(1)}k';
    }
    return '$n';
  }
}
