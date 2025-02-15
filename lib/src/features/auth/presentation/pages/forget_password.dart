import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/images.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_signIn_buttons.dart';
import '../../../../core/widgets/custom_text_formField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/logo_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: '',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.forgotPassword.tr(),
                    style: TextStylesManager.extraBold18,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    title: '',
                    hintText: AppStrings.emailAddress.tr(),
                  ),


                  SizedBox(height: 24.h),

                  CustomButton(
                    onTap: () {},
                    text: AppStrings.resetPassword.tr(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
