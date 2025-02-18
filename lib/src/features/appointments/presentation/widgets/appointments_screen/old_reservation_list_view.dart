import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/appointment_entity.dart';
import 'old_reservations_card.dart';

class OldReservationListView extends StatelessWidget {
  const OldReservationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              StaticData.appointments.length,
                  (index) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: SizedBox(
                  width: 300.w,
                  child: OldReservationCard(
                    appointment: StaticData.appointments[index],
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
