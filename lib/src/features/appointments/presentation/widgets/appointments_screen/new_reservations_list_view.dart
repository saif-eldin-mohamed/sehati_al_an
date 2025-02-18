import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/appointment_entity.dart';
import 'new_reservations_card.dart';

class NewReservationListView extends StatelessWidget {
  const NewReservationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        StaticData.appointments.length,
            (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: NewReservationCard(
            appointment: StaticData.appointments[index],
          ),
        ),
      ),
    );
  }
}
