import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/widgets/title_widget.dart';
import 'gallery_widget.dart';

class PatientReviewsSection extends StatelessWidget {
  const PatientReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PatientReview(
          patientName: 'اسم المريض',
          date: '١٩ أبريل، ٢٠٢٣',
          review:
              'الدكتورة سارة باتيل طبيبة ذات معرفة واسعة. أقدر كثيرًا الوقت الذي تخصصه للاستماع إلى مخاوف مرضاها والإجابة على أسئلتهم.',
          rating: 4.5,
        ),
        SizedBox(height: 12.h),
        PatientReview(
          patientName: 'اسم المريض',
          date: '١٨ أبريل، ٢٠٢٣',
          review:
              'هي دائمًا منتبهة ودقيقة، ولديها أسلوب مراعٍ يجعل المريض يشعر بالراحة.',
          rating: 5.0,
        ),
      ],
    );
  }
}

class PatientReview extends StatelessWidget {
  final String patientName;
  final String date;
  final String review;
  final double rating;

  const PatientReview({
    Key? key,
    required this.patientName,
    required this.date,
    required this.review,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 28.r,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      patientName,
                      style: TextStylesManager.bold16,
                    ),
                    Text(
                      date,
                      style: TextStylesManager.regular12.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < rating.round()
                          ? Colors.amber
                          : Colors.grey.shade300,
                      size: 18.r,
                    );
                  }),
                ),
                SizedBox(height: 6.h),
                Text(
                  review,
                  style: TextStylesManager.regular14.copyWith(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
