import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';

import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          children: [
            SizedBox(height: 200.h),
            Center(
              child: Image.asset(
                ImagesManager.noNotificationImg,
                height: 150.h,
                width: 150.w,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            const Text(
              'No Notifications Yet',
              style: TextStylesManager.extraBold24,
            ),
            SizedBox(
              height: 12.h,
            ),
            const Text(
              "You haven't received any notifications at the moment.\nStay tuned for updates and alerts.",
              style: TextStylesManager.regular16,
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              onTap: () {},
              text: 'Find a Doctor & Book Now',
            )
          ],
        ),
      ),
    );
  }
}
