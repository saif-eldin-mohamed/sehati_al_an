import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:intl/intl.dart';
import '../../../../../core/widgets/status_button.dart';
import '../../../../appointments/data/models/appointment_model.dart';
import '../../../../appointments/domain/entities/appointment_entity.dart';
import '../../../../appointments/presentation/widgets/appointment_button.dart';

class HomeAppointmentList extends StatelessWidget {
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

  HomeAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            appointments.length,
            (index) => HomeAppointmentCard(
              appointment: StaticData.appointments[index],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeAppointmentCard extends StatefulWidget {
  final Appointment appointment;

  const HomeAppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  State<HomeAppointmentCard> createState() => _HomeAppointmentCardState();
}

class _HomeAppointmentCardState extends State<HomeAppointmentCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final buttons = AppointmentActions.getButtons(
      widget.appointment,
      context,
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isHovered ? ColorsManager.primary : ColorsManager.lightGrey,
        ),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: ColorsManager.primary.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            : [],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.appointment.type.displayName,
              style: TextStylesManager.regular12),
          SizedBox(height: 6.h),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.black54),
              SizedBox(width: 6.w),
              Expanded(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: DateFormat('EEE dd MMM')
                            .format(widget.appointment.dateTime),
                      ),
                      TextSpan(
                        text: "  ●  ",
                        style: TextStyle(
                          fontSize: 16.r,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "${DateFormat('h:mma').format(widget.appointment.dateTime)} - ${DateFormat('h:mma').format(widget.appointment.dateTime.add(widget.appointment.duration))}",
                      ),
                    ],
                  ),
                ),
              ),
              StatusButton(
                status: widget.appointment.status.displayName,
                // color: widget.appointment.status.color,
              ),
            ],
          ),
          Divider(height: 18.h, color: ColorsManager.lightGrey),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.appointment.doctorName,
                      style: TextStylesManager.bold16,
                    ),
                    Text(
                      widget.appointment.specialty,
                      style: TextStylesManager.regular12,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Hero(
                tag: widget.appointment.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    widget.appointment.doctorImage,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
