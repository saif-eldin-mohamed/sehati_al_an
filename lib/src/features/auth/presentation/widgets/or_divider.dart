import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/colors.dart';
import '../../../../core/resourses/theming/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: ColorsManager.lightGrey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            AppStrings.or.tr(),
            style: TextStylesManager.regular14,
          ),
        ),
        const Expanded(
          child: Divider(
            color: ColorsManager.lightGrey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
