import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';

import '../../../../core/resourses/theming/colors.dart';
import '../../../../core/resourses/theming/styles.dart';
import '../../../../core/widgets/default_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Profile',
        showLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
        child: Column(
          children: [
            // SizedBox(height: 12.h),
            Column(
              children: [
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      ImagesManager.onBoarding_1,
                      width: 80.r,
                      height: 80.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // User Name
                Text(
                  'Abanop Samuel',
                  style: TextStylesManager.extraBold18.copyWith(
                    color: ColorsManager.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            // Menu Options
            Expanded(
              child: ListView(
                children: [
                  _buildMenuOption(
                      icon: SvgsManager.profile2Svg,
                      title: 'Edit Profile',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.favoriteSvg,
                      title: 'Favorites',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.comments2Svg,
                      title: 'Messages',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.settingSvg,
                      title: 'Settings',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.editTextSvg,
                      title: 'Customer Service',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.help1Svg, title: 'FAQs', onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.favorite1Svg,
                      title: 'Rate us',
                      onTap: () {}),
                  _buildMenuOption(
                      icon: SvgsManager.logout1Svg,
                      title: 'Sign out',
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption(
      {required String icon,
      required String title,
      required void Function() onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
        ),

        // Icon(icon, color: Colors.black54, size: 24.r),
        title: Text(
          title,
          style: TextStylesManager.bold14.copyWith(
            color: ColorsManager.primary,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        onTap: onTap,
      ),
    );
  }
}
