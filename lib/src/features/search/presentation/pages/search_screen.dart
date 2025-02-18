import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resourses/theming/colors.dart';
import '../../../../core/resourses/theming/styles.dart';
import '../../../../core/resourses/theming/images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dentistry',
          style: TextStylesManager.extraBold20.copyWith(
            color: ColorsManager.primary,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for doctor, specialty',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: ColorsManager.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: ColorsManager.lightGrey.withOpacity(0.5),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: ColorsManager.primary,
                      width: 1.5.w,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: ColorsManager.primary,
                    size: 24.w,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Most Popular Majors Section
            Text(
              'Most popular majors',
              style: TextStylesManager.bold16.copyWith(
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => _buildSpecialtyItem(
                  SvgsManager.DentistrySvg,
                  'Dentistry',
                ),
              ),
            ),
            //
            // SizedBox(height: 24.h),
            //
            // // Other Specializations Section
            // Text(
            //   'Other specializations',
            //   style: TextStylesManager.bold16.copyWith(
            //     color: Colors.black87,
            //     letterSpacing: 0.3,
            //   ),
            // ),
            // SizedBox(height: 16.h),
            //
            // Expanded(
            //   child: ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     itemCount: 5,
            //     itemBuilder: (context, index) => _buildSpecialtyItem(
            //       SvgsManager.DentistrySvg,
            //       'Dentistry',
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialtyItem(String imagePath, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.r),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: ColorsManager.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    imagePath,
                    width: 24.w,
                    height: 24.h,
                    color: ColorsManager.primary,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStylesManager.regular16.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.w,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}