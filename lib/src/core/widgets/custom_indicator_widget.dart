import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';

class IndicatorDotsWidget extends StatelessWidget {
  final bool isActive;

  const IndicatorDotsWidget({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 8.h,
        width: 8.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? ColorsManager.primary : ColorsManager.background,
          border: Border.all(
            color: isActive ? ColorsManager.primary : ColorsManager.background,
            width: 2.w,
          ),
        ),
      ),
    );
  }
}
