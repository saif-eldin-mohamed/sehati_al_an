import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

import '../../../../core/resourses/theming/colors.dart';
import '../widgets/search_details/app_bar.dart';
import '../widgets/search_details/doctor_consultation_list_view.dart';

class SearchResultsCategories extends StatelessWidget {
  const SearchResultsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarSearchDetails(), body: DoctorConsultationListView());
  }
}
