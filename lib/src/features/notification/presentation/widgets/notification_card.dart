import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class NotificationCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String highlightText;

  const NotificationCard({
    required this.image,
    required this.title,
    required this.description,
    required this.highlightText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: ColorsManager.primary.withOpacity(.2),
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 24.r,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStylesManager.bold16),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        style: TextStylesManager.regular16,
                        children: [
                          TextSpan(text: description),
                          TextSpan(
                            text: ' $highlightText',
                            style: TextStylesManager.bold16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
