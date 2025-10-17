import 'package:flutter/material.dart';
import 'package:lab_2/list_items/search_bar_list_item.dart';
import 'package:lab_2/resources/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.item});
  final SearchBarListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.colorffff,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.colorD9D9, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: AppColors.color8888,
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: AppColors.color0000,
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (value) => item.onSearchChanged?.call(value),
              ),
            ),
            Icon(Icons.search, color: AppColors.colorB1B1, size: 15),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
