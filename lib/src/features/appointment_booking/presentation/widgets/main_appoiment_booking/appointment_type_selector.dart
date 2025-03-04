import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/resourses/theming/styles.dart';

class AppointmentTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const AppointmentTypeSelector({
    Key? key,
    required this.selectedType,
    required this.onTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع الموعد',
          style: TextStylesManager.extraBold18
              .copyWith(color: ColorsManager.primary),
        ),
        SizedBox(height: 4.h),
        Text(
          'تم تحديد نوع الموعد الافتراضي.\nيمكنك اختيار نوع مختلف لعرض المواعيد المتاحة.',
          style: TextStylesManager.regular16.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            _buildTypeOption(
              'موعد مباشر',
              SvgsManager.doctorIconSvg,
              '24\$',
              selectedType == 'موعد مباشر',
            ),
            SizedBox(width: 12.w),
            _buildTypeOption(
              'مكالمة فيديو',
              SvgsManager.videoCameraSvg,
              '12\$',
              selectedType == 'مكالمة فيديو',
            ),
            SizedBox(width: 12.w),
            _buildTypeOption(
              'رسائل',
              SvgsManager.commentsSvg,
              '5\$',
              selectedType == 'رسائل',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeOption(
      String title, String imagePath, String price, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTypeSelected(title),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.softBlue : ColorsManager.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color:
                  isSelected ? ColorsManager.primary : ColorsManager.lightGrey,
              width: 1.w,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  imagePath,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStylesManager.regular12.copyWith(
                  color: isSelected
                      ? ColorsManager.primary
                      : ColorsManager.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                price,
                style: TextStylesManager.bold14.copyWith(
                  color: isSelected
                      ? ColorsManager.primary
                      : ColorsManager.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
