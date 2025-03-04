import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';

class DoctorInfoCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String rating;
  final String reviewsCount;
  final String avatarUrl;
  final bool isLiked;
  final VoidCallback onLikeToggle;

  const DoctorInfoCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.reviewsCount,
    required this.avatarUrl,
    required this.isLiked,
    required this.onLikeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: AssetImage(avatarUrl),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      doctorName,
                      style: TextStylesManager.bold16,
                    ),
                  ),
                  GestureDetector(
                    onTap: onLikeToggle,
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : ColorsManager.grey,
                      size: 24,
                    ),
                  ),
                ],
              ),
              Text(
                specialty,
                style: TextStylesManager.regular14.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: ColorsManager.accent,
                    size: 24,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '$rating ($reviewsCount تقييم)',
                    style: TextStylesManager.regular12,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض التقييمات',
                      style: TextStylesManager.regular12.copyWith(
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
