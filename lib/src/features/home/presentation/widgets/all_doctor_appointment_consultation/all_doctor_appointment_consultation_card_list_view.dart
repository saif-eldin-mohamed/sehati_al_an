import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/images.dart';
import '../home_header/doctor_appointment_consultation_card.dart';

class AllDoctorAppointmentConsultationCardListView extends StatelessWidget {
  const AllDoctorAppointmentConsultationCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      // physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
          child: const DoctorAppointmentConsultationCard(
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
    );
  }
}
