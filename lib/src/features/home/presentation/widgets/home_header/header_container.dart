import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/resourses/language_manager.dart';
import 'package:sehati_al_an_app/src/features/home/presentation/widgets/home_header/welcom_secion.dart';
import '../../../../../core/app_prefrences/app_prefrences.dart';
import '../../../../../core/helpers/enums.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/services/dependency_injection.dart';
import 'book_now_button.dart';
import 'doctor_image.dart';

class HomeHeaderContainer extends StatelessWidget {
  const HomeHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic =
        sl<AppPreferences>().getAppLanguage() == LanguageType.arabic.getValue;

    return Container(
      height: 318.h,
      width: double.infinity,
      decoration: _buildContainerDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35.h),
                const WelcomeSection(),
                SizedBox(height: 10.h),
                const BookNowButton(),
              ],
            ),
          ),
          Positioned(
            right: isArabic ? null : 0,
            left: isArabic ? 0 : null,
            bottom: 0,
            child: const DoctorImage(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      gradient: LinearGradient(
        colors: [
          const Color(0xFF1B5A64),
          ColorsManager.primary.withOpacity(0.8),
          ColorsManager.background,
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      ),
      // boxShadow: [
      //   BoxShadow(
      //     color: ColorsManager.primary.withOpacity(0.3),
      //     blurRadius: 15,
      //     offset: const Offset(0, 5),
      //   ),
      // ],
    );
  }
}
