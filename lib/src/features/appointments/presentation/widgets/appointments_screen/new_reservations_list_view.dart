import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/appointment_entity.dart';
import 'new_reservations_card.dart';

class NewReservationListView extends StatelessWidget {
  const NewReservationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: StaticData.appointments.length,
        itemBuilder: (context, index) {
          return NewReservationCard(
            appointment: StaticData.appointments[index],
          );
        },
      ),
    );
  }
}
