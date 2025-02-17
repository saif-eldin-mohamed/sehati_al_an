import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';

import '../../../../core/resourses/theming/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmptyAppointmentsScreen extends StatelessWidget {
  const EmptyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:  8.0.w),
        child: Column(
          children: [
            SizedBox(height:  200.h),
            Center(
              child: Image.asset(ImagesManager.appoimentEmptyImg,
              height: 150.h,width: 150.w,),
            ),
            SizedBox(height: 24.h,),
            Text('Your Appointments Empty',style: TextStylesManager.extraBold24,),
            SizedBox(height: 12.h,),

            Text('Book your first appointment, and search for \n a doctor or specialty',style: TextStylesManager.regular16,),
            SizedBox(height: 48.h,),
            CustomButton(onTap: (){},text: 'Search',)

          ],
        ),
      ),
    );
  }
}
