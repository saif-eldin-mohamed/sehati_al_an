import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';
import 'package:sehati_al_an_app/src/features/appointments/presentation/widgets/appointments_details_screen/review.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/appointment_info.dart';
import '../../../../../core/widgets/review_dialog.dart';

class AppointmentInfoWidget extends StatelessWidget {
  const AppointmentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppointmentInfo(
          title: 'Type',
          leftText: 'Appointment',
          rightText: 'at the clinic',
        ),
        SizedBox(
          height: 24.h,
        ),
        const AppointmentInfo(
          title: 'Date & Time',
          leftText: 'Monday, 10 April',
          rightText: '2:00 pm to 2:45pm',
        ),
        SizedBox(
          height: 24.h,
        ),
        const AppointmentInfo(
          title: 'Payment method',
          leftText: 'Pay by',
          rightText: '**** 7766',
          rightImage: ImagesManager.vISAImg,
        ),
        SizedBox(
          height: 24.h,
        ),
        const AppointmentInfo(
          title: 'Location',
          leftText: '234 West 42nd Street',
          rightText: '',
        ),
        SizedBox(
          height: 12.h,
        ),
        const Review(),
        SizedBox(
          height: 24.h,
        ),
        Container(
          width: double.infinity,
          height: 120.h,
          padding: EdgeInsets.all(12.r),
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: AssetImage(ImagesManager.locationImg),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE1E6ED)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomButton(
          text: 'Write your review',
          backgroundColor: ColorsManager.primary.withOpacity(0.2),
          textColor: ColorsManager.primary,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ReviewBottomSheet(
                  onSubmit: (title, description, rating) {
                    log('Rating: $rating');
                    log('Title: $title');
                    log('Description: $description');
                  },
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomButton(
          text: 'Join Call',
          backgroundColor: ColorsManager.primary,
          textColor: ColorsManager.white,
          onTap: () {
            Navigator.pushNamed(context, Routes.videoCallScreen);
          },
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
