import 'package:flutter/material.dart';
import 'package:lab_2/resources/app_colors.dart';

class StartTrialWidget extends StatelessWidget {
  const StartTrialWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Start your 7–day free Trial',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.color6C6C,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.0,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.color6C6C,
              decorationThickness: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
