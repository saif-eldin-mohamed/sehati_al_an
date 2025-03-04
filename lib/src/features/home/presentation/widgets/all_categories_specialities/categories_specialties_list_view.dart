import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/widgets/custom_category_card.dart';

class CategoriesSpecialtiesGridView extends StatelessWidget {
  const CategoriesSpecialtiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'title': AppStrings.dentistry.tr(), 'image': SvgsManager.DentistrySvg},
      {'title': AppStrings.psychiatry.tr(), 'image': SvgsManager.psychiatrySvg},
      {'title': AppStrings.neurology.tr(), 'image': SvgsManager.neurologySvg},
      {
        'title': AppStrings.internal_diseases.tr(),
        'image': SvgsManager.internalDiseasesSvg
      },
      {
        'title': AppStrings.internal_diseases.tr(),
        'image': SvgsManager.internalDiseasesSvg
      },
      {
        'title': AppStrings.internal_diseases.tr(),
        'image': SvgsManager.internalDiseasesSvg
      },
      {
        'title': AppStrings.internal_diseases.tr(),
        'image': SvgsManager.internalDiseasesSvg
      },
      {
        'title': AppStrings.internal_diseases.tr(),
        'image': SvgsManager.internalDiseasesSvg
      },
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600
            ? 4
            : 3, // 3 للعادي و 4 للتابلت
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1.0,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CustomCategoryCard(
          title: categories[index]['title']!,
          imagePath: categories[index]['image']!,
        );
      },
    );
  }
}
