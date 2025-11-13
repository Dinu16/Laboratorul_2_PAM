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
          Stack(
            children:[
              Icon(
                Icons.notifications,
                size: 26,
                color: AppColors.color707E,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.colorF000,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  child: Text(
                    "${item.nrOfNotifications}",
                    style: TextStyle(
                      color: AppColors.colorffff,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}
