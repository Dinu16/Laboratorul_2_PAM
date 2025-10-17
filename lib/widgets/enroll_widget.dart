import 'package:flutter/material.dart';
import 'package:lab_2/resources/app_colors.dart';

class EnrollWidget extends StatelessWidget {
  const EnrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 0),
      child: SizedBox(
        height: 46,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.color707E,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: Text(
            'ENROLL NOW',
            style: TextStyle(
              color: AppColors.colorEFF2,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
