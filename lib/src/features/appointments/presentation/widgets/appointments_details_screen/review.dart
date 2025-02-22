import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/styles.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Good listener', style: TextStylesManager.bold16),
            Text('April 18, 2024', style: TextStylesManager.semiBold12),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        const Text(
            'The doctor is a good listener, pays attention to details, and is good at explaining things to the patient',
            style: TextStylesManager.regular14),
      ],
    );
  }
}
