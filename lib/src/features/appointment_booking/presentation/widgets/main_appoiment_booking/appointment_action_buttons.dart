import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';

class AppointmentActionButtons extends StatelessWidget {
  final Function(bool) onViewChanged;
  final bool showAppointmentView;

  const AppointmentActionButtons({
    Key? key,
    required this.onViewChanged,
    required this.showAppointmentView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onViewChanged(true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  showAppointmentView ? ColorsManager.primary : Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: ColorsManager.primary),
              ),
            ),
            child: Text(
              'موعد',
              style: TextStylesManager.bold14.copyWith(
                color: showAppointmentView
                    ? ColorsManager.white
                    : ColorsManager.primary,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onViewChanged(false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  !showAppointmentView ? ColorsManager.primary : Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: ColorsManager.primary),
              ),
            ),
            child: Text(
              'تفاصيل الطبيب',
              style: TextStylesManager.bold14.copyWith(
                color: !showAppointmentView
                    ? ColorsManager.white
                    : ColorsManager.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
