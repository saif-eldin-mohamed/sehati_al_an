import 'package:flutter/cupertino.dart';
import 'package:sehati_al_an_app/src/features/home/presentation/widgets/home_header/upcoming_appointment_card.dart';

import '../../../../appointments/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppointmentListView extends StatelessWidget {
  const HomeAppointmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                StaticData.appointments.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SizedBox(
                    width: 300.w,
                    child: HomeUpcomingAppointmentCard(
                      appointment: StaticData.appointments[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
