import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/theming/colors.dart';
import '../../../../core/resourses/theming/styles.dart';
import '../../../../core/widgets/default_app_bar.dart';
import '../widgets/search_screen/build_specialty_item_list_view.dart';
import '../widgets/search_screen/custom_search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Dentistry',
        showLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(
              controller: TextEditingController(),
            ),
            SizedBox(height: 24.h),
            Text(
              'Most popular majors',
              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.primary,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: 16.h),
            const SpecialtyItemListView()
          ],
        ),
      ),
    );
  }
}
