import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resourses/theming/images.dart';
import 'doctor_appointment_card.dart';

class DoctorAppointmentCardListView extends StatelessWidget {
  const DoctorAppointmentCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: const DoctorAppointmentCard(
              doctorName: 'Dr. Sarah Patel',
              specialty: 'Internal Medicine',
              rating: 4.95,
              reviewCount: 150,
              imageUrl: ImagesManager.onBoarding_3,
              inPersonPrice: 24,
              videoPrice: 12,
              chatPrice: 5,
              availableSlots: [
                '10:15 am',
                '11:00 am',
                '11:45 am',
                '10:15 am',
                '11:00 am',
                '11:45 am',
                '10:15 am',
                '11:00 am',
                '11:45 am',
              ],
            ),
          );
        },
      ),
    );
  }
}
