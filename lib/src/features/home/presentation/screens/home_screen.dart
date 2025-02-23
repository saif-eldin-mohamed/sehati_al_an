import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/colors.dart';
import '../../../../core/widgets/section_header.dart';
import '../widgets/home_header/custom_category_card.dart';
import '../widgets/home_header/doctor_appointment_consultation_card_list_view.dart';
import '../widgets/home_header/header_container.dart';
import '../widgets/home_header/upcoming_appointment_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeaderContainer(),
            SectionHeader(
              title: AppStrings.most_popular_specialties,
              buttonText: AppStrings.view_all,
              onPressed: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            const CategoriesRow(),
            SectionHeader(
              title: AppStrings.book_a_consultation_again,
              buttonText: AppStrings.view_all,
              onPressed: () {},
            ),
            const DoctorAppointmentConsultationCardListView(),
            SectionHeader(
              title: AppStrings.upcoming_appointments,
              buttonText: AppStrings.view_all,
              onPressed: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            const HomeAppointmentListView()
          ],
        ),
      ),
    );
  }
}
