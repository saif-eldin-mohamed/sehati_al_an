import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/features/appointment_booking/presentation/widgets/main_appoiment_booking/patient_reviews.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/widgets/title_widget.dart';
import 'gallery_widget.dart';

class DoctorDetailsView extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String avatarUrl;

  const DoctorDetailsView({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  State<DoctorDetailsView> createState() => _DoctorDetailsViewState();
}

class _DoctorDetailsViewState extends State<DoctorDetailsView> {
  bool _isExpandedBio = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'السيرة الذاتية'),
          BiographyCard(
            isExpanded: _isExpandedBio,
            onMorePressed: () {
              setState(() {
                _isExpandedBio = !_isExpandedBio;
              });
            },
          ),
          SizedBox(height: 16.h),
          const SectionTitle(title: 'معرض الصور'),
          GallerySection(
            imageUrls: [
              ImagesManager.doctorImg,
              ImagesManager.onBoarding_1,
              ImagesManager.onBoarding_2,
              ImagesManager.onBoarding_3,
              ImagesManager.doctorImg,
              ImagesManager.onBoarding_1,
              ImagesManager.onBoarding_2,
              ImagesManager.onBoarding_3,
              ImagesManager.doctorImg,
              ImagesManager.onBoarding_1,
              ImagesManager.onBoarding_2,
              ImagesManager.onBoarding_3,
            ],
          ),
          SizedBox(height: 16.h),
          const SectionTitle(title: 'تقييمات المرضى (١٧٠ تقييم)'),
          PatientReviewsSection(),
        ],
      ),
    );
  }
}
