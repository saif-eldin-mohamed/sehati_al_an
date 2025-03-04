import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/all_categories_specialities/categories_specialties_list_view.dart';

class AllCategoriesSpecialtiesScreen extends StatelessWidget {
  const AllCategoriesSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'اشهر ابتخصصات',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: const CategoriesSpecialtiesGridView(),
      ),
    );
  }
}
