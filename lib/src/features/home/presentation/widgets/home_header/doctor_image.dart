import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resourses/theming/images.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ImagesManager.doctorImg,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Image.asset(
          ImagesManager.doctorImg,
          height: 250.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
