import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class AppointmentInfo extends StatelessWidget {
  final String title;
  final String leftText;
  final String rightText;
  final String? leftImage;
  final String? rightImage;
  final Color textColor;

  const AppointmentInfo({
    super.key,
    required this.title,
    required this.leftText,
    required this.rightText,
    this.leftImage,
    this.rightImage,
    this.textColor = ColorsManager.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStylesManager.bold16,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRichText(leftText, leftImage),
            _buildRichText(rightText, rightImage),
          ],
        ),
      ],
    );
  }

  Widget _buildRichText(String text, String? imagePath) {
    return RichText(
      text: TextSpan(
        style: TextStylesManager.bold16.copyWith(color: textColor),
        children: [
          if (imagePath != null)
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Image.asset(
                  imagePath,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          TextSpan(text: text),
        ],
      ),
    );
  }
}
