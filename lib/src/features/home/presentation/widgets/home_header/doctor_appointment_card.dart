import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorAppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final double inPersonPrice;
  final double videoPrice;
  final double chatPrice;
  final List<String> availableSlots;

  const DoctorAppointmentCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.inPersonPrice,
    required this.videoPrice,
    required this.chatPrice,
    required this.availableSlots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 253.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.lightGrey),
      ),
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStylesManager.bold16
                          .copyWith(color: ColorsManager.primary),
                    ),
                    Text(
                      specialty,
                      style: TextStylesManager.regular12
                          .copyWith(color: Colors.grey[700]),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4.w),
                        Text(
                          '$rating',
                          style: TextStylesManager.regular12
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ($reviewCount reviews)',
                          style: TextStylesManager.regular12
                              .copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    imageUrl,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildPriceItem(SvgsManager.doctorIconSvg,
                  '\$${inPersonPrice.toStringAsFixed(0)}'),
              SizedBox(
                width: 8.w,
              ),
              _buildPriceItem(SvgsManager.videoCameraSvg,
                  '\$${videoPrice.toStringAsFixed(0)}'),
              SizedBox(
                width: 8.w,
              ),
              _buildPriceItem(
                  SvgsManager.commentsSvg, '\$${chatPrice.toStringAsFixed(0)}'),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Available Today',
            style: TextStylesManager.semiBold12
                .copyWith(color: ColorsManager.primary),
          ),
          SizedBox(height: 4.h),
          _buildTimeRow(availableSlots),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  Widget _buildPriceItem(String imagePath, String price) {
    return Row(
      children: [
        Container(
          width: 28.w,
          height: 28.h,
          decoration: const BoxDecoration(
            color: Color(0xFFE1E6ED),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            imagePath,
            width: 16.w,
            height: 16.h,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          price,
          style:
              TextStylesManager.bold14.copyWith(color: ColorsManager.primary),
        ),
      ],
    );
  }

  Widget buildTimeRow(List<String> times) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: times
            .map((time) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: _buildTimeItem(time: time),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildTimeRow(List<String> times) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: times
            .map((time) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: _buildTimeItem(time: time),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildTimeItem({required String time}) {
    return Container(
      width: 58.w,
      height: 30.h,
      decoration: ShapeDecoration(
        color: ColorsManager.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStylesManager.regular12,
          ),
        ],
      ),
    );
  }
}
