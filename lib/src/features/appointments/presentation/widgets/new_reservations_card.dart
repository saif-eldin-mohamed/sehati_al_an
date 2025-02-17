import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:intl/intl.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/widgets/status_button.dart';
import '../../data/models/appointment_model.dart';
import 'appointment_button.dart';

class AppointmentCard extends StatefulWidget {
  final Appointment appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
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
          if (buttons.isNotEmpty) ...[
            SizedBox(height: 10.h),
            Row(
              children: buttons.map((button) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: CustomButton(
                      onTap: button.onPressed,
                      text: button.text,
                      backgroundColor: button.backgroundColor,
                      textColor: button.textColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
