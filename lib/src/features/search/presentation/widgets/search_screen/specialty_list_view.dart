
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/resourses/theming/styles.dart';
import 'specialty_item.dart';

class SpecialtyListView extends StatelessWidget {
  final String title;
  final int itemCount;

  const SpecialtyListView({
    super.key,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStylesManager.bold16.copyWith(
            color: Colors.black87,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) => SpecialtyItem(
              imagePath: SvgsManager.DentistrySvg,
              title: 'Dentistry',
            ),
          ),
        ),
      ],
    );
  }
}