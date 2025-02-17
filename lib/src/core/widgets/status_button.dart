import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/helpers/responsive_font_size.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class StatusButton extends StatelessWidget {
  final String status;

  const StatusButton({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getStatusIcon() {
      switch (status.toLowerCase()) {
        case 'approved':
          return Icons.check_circle;
        case 'pending':
          return Icons.access_time;
        case 'cancelled':
          return Icons.cancel;
        case 'in progress':
          return Icons.autorenew;
        default:
          return Icons.info;
      }
    }

    Color getStatusColor() {
      switch (status.toLowerCase()) {
        case 'approved':
          return Colors.green;
        case 'pending':
          return Colors.orange;
        case 'cancelled':
          return Colors.red;
        case 'in progress':
          return Colors.blue;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.9),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getStatusIcon(),
            color: Colors.white,
            size: 18,
          ),
          SizedBox(width: 6.w),
          Text(
            status,
            style: TextStylesManager.bold12.copyWith(
              color: ColorsManager.white,
              fontSize: 14.responsive,
            ),
          ),
        ],
      ),
    );
  }
}
