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

class DoctorCard extends StatefulWidget {
  final Appointment appointment; // Add the appointment entity as a parameter

  const DoctorCard({
    super.key,
    required this.appointment, // Pass the appointment entity in the constructor
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.appointment.doctorName, // Use the actual doctor name
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStylesManager.bold16,
                  ),
                  Text(
                    widget.appointment.specialty, // Use the actual specialty
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStylesManager.regular12,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Hero(
              tag: 'doctor_${widget.appointment.id}', // Use the unique doctor ID for the tag
              child: CircleAvatar(
                radius: 48.r,
                backgroundColor: ColorsManager.lightGrey,
                backgroundImage: AssetImage(ImagesManager.doctorImg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
