import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';

import '../../../../core/widgets/status_button.dart';

class OldReservationsList extends StatelessWidget {
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

  OldReservationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.05)],
            stops: const [0.9, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return OldReservationsCard(appointment: appointments[index]);
          },
        ),
      ),
    );
  }
}

class OldReservationsCard extends StatefulWidget {
  final Map<String, dynamic> appointment;

  const OldReservationsCard({super.key, required this.appointment});

  @override
  _OldReservationsCardState createState() => _OldReservationsCardState();
}

class _OldReservationsCardState extends State<OldReservationsCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
            color: isHovered ? ColorsManager.primary : ColorsManager.lightGrey),
        boxShadow: isHovered
            ? [
                BoxShadow(
                    color: ColorsManager.primary.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2)
              ]
            : [],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Appointment date", style: TextStylesManager.semiBold12),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.access_time, size: 18, color: Colors.black54),
              SizedBox(width: 6.w),
              Expanded(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: widget.appointment["date"]),
                      TextSpan(
                          text: "  ●  ",
                          style: TextStyle(
                              fontSize: 16.r, fontWeight: FontWeight.bold)),
                      TextSpan(text: widget.appointment["time"]),
                    ],
                  ),
                ),
              ),
              StatusButton(status: widget.appointment["status"]!),
            ],
          ),
          Divider(height: 18.h, color: ColorsManager.lightGrey),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.appointment["doctor"]!,
                        style: TextStylesManager.bold16),
                    Text(widget.appointment["specialty"]!,
                        style: TextStylesManager.regular12),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Hero(
                tag: widget.appointment["doctor"]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    widget.appointment["image"]!,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
