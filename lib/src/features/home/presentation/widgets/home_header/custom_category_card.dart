import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/images.dart';

class CustomCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CustomCategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0.w),
      child: Container(
        width: 78.6.w,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 32.91.w,
              height: 32.91.h,
            ),
            SizedBox(height: 8.h),
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStylesManager.regular12),
          ],
        ),
      ),
    );
  }
}

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomCategoryCard(
              title: AppStrings.dentistry.tr(),
              imagePath: SvgsManager.DentistrySvg),
          CustomCategoryCard(
              title: AppStrings.psychiatry.tr(),
              imagePath: SvgsManager.psychiatrySvg),
          CustomCategoryCard(
              title: AppStrings.neurology.tr(),
              imagePath: SvgsManager.neurologySvg),
          CustomCategoryCard(
              title: AppStrings.internal_diseases.tr(),
              imagePath: SvgsManager.internalDiseasesSvg),
        ],
      ),
    );
  }
}
