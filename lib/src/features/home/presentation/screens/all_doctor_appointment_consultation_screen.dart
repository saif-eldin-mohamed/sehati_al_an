import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';

import '../widgets/all_doctor_appointment_consultation/all_doctor_appointment_consultation_card_list_view.dart';

class AllDoctorAppointmentConsultationScreen extends StatelessWidget {
  const AllDoctorAppointmentConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: 'مواعيد الاستشارات'),
      body: AllDoctorAppointmentConsultationCardListView(),
    );
  }
}
