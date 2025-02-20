import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import '../../../../core/widgets/default_app_bar.dart';
import '../../domain/entities/appointment_entity.dart';
import '../widgets/appointments_details_screen/appointment_info_widget.dart';
import '../widgets/appointments_details_screen/doctor_card.dart';

class AppointmentsDetailsScreen extends StatelessWidget {
  const AppointmentsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCard(
                appointment: StaticData.appointments.first,
              ),
              SizedBox(
                height: 24.h,
              ),
              const AppointmentInfoWidget()
            ],
          ),
        ),
      ),
    );
  }
}
