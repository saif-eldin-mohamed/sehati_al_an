import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

import '../../../../../core/widgets/status_button.dart';

class AppointmentList extends StatelessWidget {
  final List<Map<String, String>> appointments = List.generate(
    5,
        (index) => {
      "date": "Mon 10 Apr",
      "time": "2:00pm to 2:45pm",
      "status": "Approved",
      "doctor": "Mitchel Daniel",
      "specialty": "Primary Care",
      "image": ImagesManager.onBoarding_3,
    },
  );

  AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            appointments.length,
                (index) => AppointmentCard(appointment: appointments[index]),
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Map<String, String> appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorsManager.lightGrey),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Appointment date",
            style: TextStylesManager.semiBold12,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.black54),
              SizedBox(width: 4.w),
              Expanded(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: appointment["date"]),
                       TextSpan(
                        text: "  ●  ",
                        style: TextStyle(fontSize: 16.r),
                      ),
                      TextSpan(text: appointment["time"]),
                    ],
                  ),
                ),
              ),
              StatusButton(status: appointment["status"]!)
            ],
          ),
          Divider(
            height: 18.h,
            color: ColorsManager.lightGrey,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appointment["doctor"]!,
                      style: TextStylesManager.bold16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      appointment["specialty"]!,
                      style: TextStylesManager.regular12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              ClipOval(
                child: Image.asset(
                  appointment["image"]!,
                  fit: BoxFit.contain,
                  width: 48.w,
                  height: 48.h,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}