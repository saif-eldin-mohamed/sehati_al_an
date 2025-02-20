import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/appointments_screen/new_reservations_list_view.dart';
import '../widgets/appointments_screen/old_reservation_list_view.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStylesManager.extraBold20.copyWith(
            color: ColorsManager.primary,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New reservations',
                style: TextStylesManager.bold16,
              ),
              SizedBox(
                height: 16.h,
              ),
              const NewReservationListView(),
              const Text(
                'New reservations',
                style: TextStylesManager.bold16,
              ),
              SizedBox(
                height: 16.h,
              ),
              const OldReservationListView()
            ],
          ),
        ),
      ),
    );
  }
}
