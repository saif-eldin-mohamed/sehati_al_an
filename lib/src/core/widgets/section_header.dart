import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resourses/theming/colors.dart';
import '../resourses/theming/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.tr(),
                style: TextStylesManager.bold16,
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonText.tr(),
                  style: TextStylesManager.bold14.copyWith(
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
