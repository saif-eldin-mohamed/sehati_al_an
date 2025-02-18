import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/status_button.dart';
import '../../data/models/appointment_model.dart';
import '../../domain/entities/appointment_entity.dart';


class OldReservationList extends StatelessWidget {
  const OldReservationList({super.key});

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
                  width:
                  300.w
                  ,
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

class OldReservationCard extends StatefulWidget {
  final Appointment appointment;

  const OldReservationCard({super.key, required this.appointment});

  @override
  State<OldReservationCard> createState() => _OldReservationCardState();
}

class _OldReservationCardState extends State<OldReservationCard> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.appointment.type.displayName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStylesManager.regular12,
            ),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStylesManager.bold16,
                      ),
                      Text(
                        widget.appointment.specialty ,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStylesManager.regular12,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Hero(
                  tag: widget.appointment.id,
                  child:CircleAvatar(
                    radius: 48.r,
                    backgroundColor: ColorsManager.lightGrey,
                    backgroundImage: AssetImage(widget.appointment.doctorImage),
                  ),


                ),
              ],
            ),
            Divider(height: 18.h, color: ColorsManager.lightGrey),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good listener',
                  style: TextStylesManager.bold16
                ),
                Text(
                  'April 18, 2024',
                  style: TextStylesManager.semiBold12
                ),
              ],
            ),
             SizedBox(height: 8.h),
            Row(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
            ),
             SizedBox(height: 8.h),
            const Text(
              'The doctor is a good listener, pays attention to details, and is good at explaining things to the patient',
              style: TextStylesManager.regular14
            ),
          ],
        ),
      ),
    );
  }
}
