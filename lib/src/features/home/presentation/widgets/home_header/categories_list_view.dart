import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/widgets/custom_category_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

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

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCategoryCard(
            title: categories[index]['title']!,
            imagePath: categories[index]['image']!,
          );
        },
      ),
    );
  }
}
