import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/main_appoiment_booking/appointment_action_buttons.dart';
import '../widgets/main_appoiment_booking/appointment_type_selector.dart';
import '../widgets/main_appoiment_booking/available_times_selector.dart';
import '../widgets/main_appoiment_booking/booking_button.dart';
import '../widgets/main_appoiment_booking/doctor_info_card.dart';
import '../widgets/main_appoiment_booking/doctor_details_view.dart';

class MainAppoimentBooking extends StatefulWidget {
  const MainAppoimentBooking({super.key});

  @override
  State<MainAppoimentBooking> createState() => _MainAppoimentBookingState();
}

class _MainAppoimentBookingState extends State<MainAppoimentBooking> {
  String selectedAppointmentType = 'موعد مباشر';
  String selectedDay = 'اليوم';
  String selectedTime = '';
  bool isLiked = false;
  bool showAppointmentView =
      true; // True for appointment view, false for doctor details

  final List<String> timeSlots = [
    '10:15 ص',
    '11:00 ص',
    '11:45 ص',
    '1:00 م',
    '1:45 م',
    '2:00 م',
    '3:00 م',
    '4:00 م',
    '5:00 م',
    '6:00 م'
  ];

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void selectAppointmentType(String type) {
    setState(() {
      selectedAppointmentType = type;
    });
  }

  void selectDay(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  void selectTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  void changeView(bool isAppointmentView) {
    setState(() {
      showAppointmentView = isAppointmentView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'تفاصيل الحجوزات'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorInfoCard(
                doctorName: 'د. سارة باتيل',
                specialty: 'طب باطني',
                rating: '4.95',
                reviewsCount: '150',
                avatarUrl: ImagesManager.onBoarding_3,
                isLiked: isLiked,
                onLikeToggle: toggleLike,
              ),

              SizedBox(height: 12.h),

              AppointmentActionButtons(
                showAppointmentView: showAppointmentView,
                onViewChanged: changeView,
              ),

              SizedBox(height: 12.h),

              // Show different content based on the selected view
              if (showAppointmentView) ...[
                // Appointment booking view
                AppointmentTypeSelector(
                  selectedType: selectedAppointmentType,
                  onTypeSelected: selectAppointmentType,
                ),

                SizedBox(height: 12.h),

                AvailableTimesSelector(
                  selectedDay: selectedDay,
                  selectedTime: selectedTime,
                  timeSlots: timeSlots,
                  onDaySelected: selectDay,
                  onTimeSelected: selectTime,
                ),
              ] else ...[
                DoctorDetailsView(
                  doctorName: 'د. سارة باتيل',
                  specialty: 'طب باطني',
                  avatarUrl: ImagesManager.doctorImg,
                ),
              ],
              SizedBox(height: 12.h),

              BookingButton(
                price: '24',
                appointmentType: selectedAppointmentType,
              ),

              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
