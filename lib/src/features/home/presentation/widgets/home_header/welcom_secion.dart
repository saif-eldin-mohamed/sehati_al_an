import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/resourses/language_manager.dart';
import '../../../../../core/app_prefrences/app_prefrences.dart';
import '../../../../../core/helpers/enums.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/services/dependency_injection.dart';
import 'book_now_button.dart';
import 'doctor_image.dart';

import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/styles.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _WelcomeText(),
        SizedBox(height: 16.h),
        const _LocationButton(),
        SizedBox(height: 24.h),
        const _ConsultationText(),
      ],
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.welcome.tr(),
      style: TextStylesManager.extraBold24.copyWith(
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}

class _LocationButton extends StatelessWidget {
  const _LocationButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.my_location, color: Colors.white, size: 20),
          SizedBox(width: 8.w),
          Text(
            AppStrings.choose_your_current_location.tr(),
            style: TextStylesManager.regular14.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ConsultationText extends StatelessWidget {
  const _ConsultationText();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.book_your_online_consultation_easily.tr(),
      style: TextStylesManager.extraBold18.copyWith(
        color: Colors.white,
        height: 1.3,
      ),
    );
  }
}
