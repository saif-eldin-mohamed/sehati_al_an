import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/new_reservations_list_view.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Appointments',
          style: TextStylesManager.extraBold20,
        )),
        elevation: 0,
        backgroundColor: ColorsManager.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Right align content
            children: [
              const Text(
                'New reservations',
                style: TextStylesManager.bold16,
              ),
              SizedBox(
                height: 16.h,
              ),
              const AppointmentListView(),
            ],
          ),
        ),
      ),
    );
  }
}
