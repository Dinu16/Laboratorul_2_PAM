import 'package:flutter/material.dart';
import 'package:lab_2/list_items/welcome_header_item.dart';

import '../resources/app_colors.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({super.key, required this.item});

  final WelcomeHeaderItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Welcome",
              style: TextStyle(
                color: AppColors.color0000,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.0,
                letterSpacing: 1.0
              ),
              children: [
                TextSpan(
                  text: "${item.userName}",
                  style: TextStyle(
                      color: AppColors.color434C,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      height: 1.0,
                      letterSpacing: 1.0
                  )
                )
              ]
            ),
            ),
          Icon(
            Icons.notifications,
            size: 20,
            color: AppColors.color707E,
          ),
        ],
      ),
    );
  }
}
