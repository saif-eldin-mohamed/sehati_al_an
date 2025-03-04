import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';

class BookingButton extends StatelessWidget {
  final String price;
  final String appointmentType;

  const BookingButton({
    Key? key,
    required this.price,
    required this.appointmentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'حجز موعد - $price\$',
        style: TextStylesManager.bold16.copyWith(
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
