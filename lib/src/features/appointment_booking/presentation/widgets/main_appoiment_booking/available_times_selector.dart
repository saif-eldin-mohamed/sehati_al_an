import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';

class AvailableTimesSelector extends StatelessWidget {
  final String selectedDay;
  final String selectedTime;
  final List<String> timeSlots;
  final Function(String) onDaySelected;
  final Function(String) onTimeSelected;

  const AvailableTimesSelector({
    Key? key,
    required this.selectedDay,
    required this.selectedTime,
    required this.timeSlots,
    required this.onDaySelected,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المواعيد المتاحة',
          style: TextStylesManager.extraBold18
              .copyWith(color: ColorsManager.primary),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            _buildDayTab('اليوم', isSelected: selectedDay == 'اليوم'),
            SizedBox(width: 16.w),
            _buildDayTab('غدًا', isSelected: selectedDay == 'غدًا'),
          ],
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: timeSlots.map((time) => _buildTimeSlot(time)).toList(),
        ),
      ],
    );
  }

  Widget _buildDayTab(String day, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () => onDaySelected(day),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? ColorsManager.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          day,
          style: TextStylesManager.bold14.copyWith(
            color: isSelected
                ? ColorsManager.primary
                : ColorsManager.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    final isSelected = selectedTime == time;
    return GestureDetector(
      onTap: () => onTimeSelected(time),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primary : ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? ColorsManager.primary : ColorsManager.lightGrey,
          ),
        ),
        child: Text(
          time,
          style: TextStylesManager.regular12.copyWith(
            color: isSelected ? ColorsManager.white : ColorsManager.textPrimary,
          ),
        ),
      ),
    );
  }
}
